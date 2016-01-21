//
//  UIView+Common.h
//
//  Copyright (c) 2015年 徐建飞. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  获取视图位置信息的类别
 */
@interface UIView (Postion)

/**
 *  根据Frame 来返回宽
 *
 *  @param rect 视图的 rect
 *
 *  @return 宽
 */
CGFloat width(CGRect rect);

/**
 *  根据Frame 来返回高
 *
 *  @param rect 视图的 rect
 *
 *  @return 高
 */
CGFloat height(CGRect rect);

/**
 *  获取屏幕的宽
 *
 *  @return 屏幕的宽
 */

CGFloat screenWidth ();
/**
 *  获取屏幕的高
 *
 *  @return 屏幕的高
 */
CGFloat screenHeight();

/**
 *  返回当前视图的宽
 *
 *  @return 视图的宽
 */
- (CGFloat)width;

/**
 *  返回当前视图的高
 *
 *  @return 视图的高
 */
- (CGFloat)height;

/**
 *  获取视图坐标
 *
 *  @param view 视图
 *
 *  @return 坐标
 */
CGFloat maxX(UIView *view);
CGFloat midX(UIView *view);
CGFloat minX(UIView *view);
CGFloat maxY(UIView *view);
CGFloat midY(UIView *view);
CGFloat minY(UIView *view);
/**
 *  得到当前年份
 *
 *  @return 年 月 日
 */
NSInteger getYear();
NSInteger getMonth();
NSInteger getDay();
@end

@interface UIView (Common)

@end
