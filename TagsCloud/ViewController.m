//
//  ViewController.m
//  TagsCloud
//
//  Created by  apple on 16/1/21.
//  Copyright © 2016年 徐建飞. All rights reserved.
//

#import "ViewController.h"
#import "AoiroSoraTagsCloud.h"
@interface ViewController () <AoiroSoraTagsCloudDelegate> {
    AoiroSoraTagsCloud *_tags;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tag标题数组
    NSArray *tagArray = @[@"tag0", @"tag1", @"tag2", @"tag3", @"tag4", @"tag5"];
    
    //随机颜色数组
    NSArray *colorArray = @[[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor redColor],[UIColor grayColor],[UIColor magentaColor],[UIColor brownColor]];
    
    //初始化View
    _tags = [[AoiroSoraTagsCloud alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150) tagArray:tagArray colorArray:colorArray];
    
    //设置代理
    _tags.delegate = self;
    _tags.center = self.view.center;
    _tags.layer.borderColor = [UIColor blackColor].CGColor;
    _tags.layer.borderWidth = 1;
    [self.view addSubview:_tags];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 500, 100, 50);
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [_tags beginAnimation];

}

//开始动画
- (void)tap {
    NSMutableArray *tagArray = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        [tagArray addObject:[NSString stringWithFormat:@"随机内容%d", arc4random()%100]];
    }
    //随机颜色数组
    NSArray *colorArray = @[[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor redColor],[UIColor grayColor],[UIColor magentaColor],[UIColor brownColor]];
    [_tags refreshWithTags:tagArray colorArray:colorArray];

}

- (void)tagClick:(NSInteger)tag {
       NSLog(@"%ld", tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
