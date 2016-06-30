//
//  UIImage+Random.m
//  IBZApp
//
//  Created by yc on 16/5/23.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import "UIImage+Random.h"

@implementation UIImage (Random)
+(UIImage *)imageWithRandomColor{
    CGRect rect = CGRectMake(0, 0, 30, 30);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[UIColor randomColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
