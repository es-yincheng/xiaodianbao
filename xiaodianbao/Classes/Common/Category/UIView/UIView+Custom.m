//
//  UIView+Custom.m
//  IBZApp
//
//  Created by yc on 16/6/3.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import "UIView+Custom.h"
#import <UIKit/UIKit.h>

@implementation UIView (Custom)

//-(void)setViewController:(BaseViewController *)viewController{
//    
//}
//
//-(BaseViewController *)getViewController{
//    for (UIView* next = [self superview]; next; next = next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[BaseViewController class]] ||
//            [nextResponder isKindOfClass:[UIViewController class]]) {
//            return (BaseViewController *)nextResponder;
//        }
//    }
//    return nil;
//}
//
//+(id)loadFromNib {
//    return [self loadFromNibNamed:NSStringFromClass(self)];
//}
//
//+(id)loadFromNibNamed:(NSString*) nibName {
//    return [FileOwner viewFromNibNamed:nibName];
//}
//
//+ (id)loadFromNibNoOwner {
//    UIView *result = nil;
//    NSArray* elements = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner: nil options: nil];
//    for (id anObject in elements) {
//        if ([anObject isKindOfClass:[self class]]) {
//            result = anObject;
//            break;
//        }
//    }
//    return result;
//}
//
//// 判断View是否显示在屏幕上
//- (BOOL)isDisplayedInScreen
//{
//    if (self == nil) {
//        return FALSE;
//    }
//    
//    CGRect screenRect = [UIScreen mainScreen].bounds;
//    
//    // 转换view对应window的Rect
//    CGRect rect = [self convertRect:self.frame fromView:nil];
//    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
//        return FALSE;
//    }
//    
//    // 若view 隐藏
//    if (self.hidden) {
//        return FALSE;
//    }
//    
//    // 若没有superview
//    if (self.superview == nil) {
//        return FALSE;
//    }
//    
//    // 若size为CGrectZero
//    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
//        return  FALSE;
//    }
//    
//    // 获取 该view与window 交叉的 Rect
//    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
//    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
//        return FALSE;
//    }
//    
//    return TRUE;
//}

@end
