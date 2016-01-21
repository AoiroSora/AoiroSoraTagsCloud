//
//  UIView+Common.m
//  FirstAXM
//
//  Copyright (c) 2015年 徐建飞. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

@end

@implementation UIView (Postion)
/**
 *  根据Frame 来返回宽
 *
 *  @param rect 视图的 rect
 *
 *  @return 宽
 */
CGFloat width(CGRect rect) {
    return CGRectGetWidth(rect);
}
/**
 *  根据Frame 来返回高
 *
 *  @param rect 视图的 rect
 *
 *  @return 高
 */
CGFloat height(CGRect rect) {
    return CGRectGetHeight(rect);
}

/**
 *  获取屏幕的宽
 *
 *  @return 屏幕的宽
 */
CGFloat screenWidth () {
    return [[UIScreen mainScreen] bounds].size.width;
}
/**
 *  获取屏幕的高
 *
 *  @return 屏幕的高
 */
CGFloat screenHeight () {
    return [[UIScreen mainScreen] bounds].size.height;
}
/**
 *  返回当前视图的宽
 *
 *  @return 视图的宽
 */
- (CGFloat)width {
    return self.frame.size.width;
}
/**
 *  返回当前视图的高
 *
 *  @return 视图的高
 */
- (CGFloat)height {
    return self.frame.size.height;
}

CGFloat maxX(UIView *view) {
    return CGRectGetMaxX(view.frame);
}

CGFloat minX(UIView *view) {
    return CGRectGetMinX(view.frame);
}

CGFloat midX(UIView *view) {
    return CGRectGetMidX(view.frame);
}

CGFloat maxY(UIView *view) {
    return CGRectGetMaxY(view.frame);
}

CGFloat midY(UIView *view) {
    return CGRectGetMidY(view.frame);
}

CGFloat minY(UIView *view) {
    return CGRectGetMinY(view.frame);
}

NSInteger getYear() {
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
     return [dateComponent year];
}
NSInteger getMonth() {
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return [dateComponent month];
}
NSInteger getDay() {
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    return [dateComponent day];
}
@end