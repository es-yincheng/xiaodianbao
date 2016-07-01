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

-(void)setViewController:(UIViewController *)viewController{
    
}

-(UIViewController *)getViewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]] ||
            [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
