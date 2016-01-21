//
//  TagsView.h
//  TagsCloud
//
//  Created by  apple on 16/1/21.
//  Copyright © 2016年 徐建飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AoiroSoraTagsCloudDelegate <NSObject>

- (void)tagClick:(NSInteger)tag;

@end

@interface AoiroSoraTagsCloud : UIView


- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSArray *)tagArray colorArray:(NSArray *)colorArray;

- (void)beginAnimation;

- (void)refreshWithTags:(NSArray *)tagArray colorArray:(NSArray *)colorArray;

@property (nonatomic, weak) id<AoiroSoraTagsCloudDelegate> delegate;

@end
