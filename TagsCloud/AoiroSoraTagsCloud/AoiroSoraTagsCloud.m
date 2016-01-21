//
//  TagsView.m
//  TagsCloud
//
//  Created by  apple on 16/1/21.
//  Copyright © 2016年 徐建飞. All rights reserved.
//

#import "AoiroSoraTagsCloud.h"
#import "UIView+Common.h"

@interface AoiroSoraTagsCloud () {
    NSMutableArray *_buttonArray;
    NSMutableArray *_frameArray;

}

@end

@implementation AoiroSoraTagsCloud

- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSArray *)tagArray colorArray:(NSArray *)colorArray {
    self = [super initWithFrame:frame];
    if (self) {
        _buttonArray = [NSMutableArray array];
        _frameArray = [NSMutableArray array];
        [self createViewWithTagArray:tagArray colorArray:colorArray];
    }
    return self;
}



- (void)createViewWithTagArray:(NSArray *)tagArray colorArray:(NSArray *)colorArray {
    
    //创建按钮
    
    for (int i = 0; i < tagArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.hidden = YES;
        button.frame = CGRectZero;
        button.tag = 1000+i;
        button.backgroundColor = colorArray[arc4random()%[colorArray count]];
        [button setTitle:tagArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:button];
        [self addSubview:button];
    }
   
}

- (void)refreshWithTags:(NSArray *)tagArray colorArray:(NSArray *)colorArray {
    //移除现存的视图
    if (_buttonArray) {
        [_buttonArray removeAllObjects];
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
    }
    [self createViewWithTagArray:tagArray colorArray:colorArray];
    [self beginAnimation];
}

//开始动画
- (void)beginAnimation {
    
    [self customFrame];
    for (UIButton *button in _frameArray) {

        button.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:1 animations:^{
            button.hidden = NO;
            button.transform = CGAffineTransformMakeScale(1, 1);

        } completion:^(BOOL finished) {
           
        }];
    }
}

//创建每个按钮位置
- (void)customFrame {

    
    [_frameArray removeAllObjects];
    
    for (UIButton *button in _buttonArray) {
       
        [self customSigleFrame:button];
    }
}

//单个buttonFrame
- (void)customSigleFrame:(UIButton *)button {
    int Wid = self.width;
    int Height = self.height;
    
    //获得随机坐标
    CGFloat x = arc4random()%Wid;
    CGFloat y = arc4random()%Height;
    
    
    //随机直径
    CGFloat wid = (arc4random()%(Wid/4)+30);
    
    button.frame = CGRectMake(x, y, wid, wid);
    
    //设置圆角
    button.layer.cornerRadius = button.frame.size.width/2;
    button.clipsToBounds = YES;
    
    //最新字体缩放
    button.titleLabel.minimumScaleFactor = 0.3f;
    //字体自适应
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    //判断是否超出边界或碰撞
    if([self isDyna:button] || [self isDynaButton:button]) {
        [self customSigleFrame:button];
    }else {
        [_frameArray addObject:button];
    }
 
}

//判断是否碰撞
- (BOOL)isDynaButton:(UIButton *)button {
    
    for (UIButton *button1 in _frameArray) {
        if (CGRectIntersectsRect(button.frame, button1.frame)) {
            return YES;
        }
    }
    
    return NO;
}

//判断是否超过边界
- (BOOL)isDyna:(UIButton *)button {
    
    if (maxX(button) - self.width > 0 ||  maxY(button) - self.height > 0) {
        return YES;
    }
    return NO;
}


//TagsViewDelegate
- (void)buttonAction:(UIButton *)button {
    if (_delegate && [_delegate respondsToSelector:@selector(tagClick:)]) {
        [_delegate tagClick:button.tag-1000];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
