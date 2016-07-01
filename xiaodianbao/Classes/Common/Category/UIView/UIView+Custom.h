//
//  UIView+Custom.h
//  IBZApp
//
//  Created by yc on 16/6/3.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

@property (nonatomic ,strong) UIViewController *viewController;

- (void)setViewController:(UIViewController *)viewController;
- (UIViewController *)getViewController;

@end
