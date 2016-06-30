//
//  UIImageView+SetImage.m
//  IBZApp
//
//  Created by yc on 16/5/20.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//#import <SDWebImage/UIImageView+WebCache.h>

#import "UIImageView+SetImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (SetImage)
-(void)setImageUrl:(NSString *)imageUrl{
    // 占位图片
//    UIImage *placeholder = [UIImage imageNamed:@"placeholderImage"];
    // 从内存\沙盒缓存中获得原图，
//    UIImage *originalImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:item.originalImage];
//    if (originalImage) { // 如果内存\沙盒缓存有原图，那么就直接显示原图（不管现在是什么网络状态）
//        self.imageView.image = originalImage;
//    } else { // 内存\沙盒缓存没有原图
//        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//        if (mgr.isReachableViaWiFi) { // 在使用Wifi, 下载原图
//            [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.originalImage] placeholderImage:placeholder];
//        } else if (mgr.isReachableViaWWAN) { // 在使用手机自带网络
//            //     用户的配置项假设利用NSUserDefaults存储到了沙盒中
//            //    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"alwaysDownloadOriginalImage"];
//            //    [[NSUserDefaults standardUserDefaults] synchronize];
//#warning 从沙盒中读取用户的配置项：在3G\4G环境是否仍然下载原图
//            BOOL alwaysDownloadOriginalImage = [[NSUserDefaults standardUserDefaults] boolForKey:@"alwaysDownloadOriginalImage"];
//            if (alwaysDownloadOriginalImage) { // 下载原图
//                [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.originalImage] placeholderImage:placeholder];
//            } else { // 下载小图
//                [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnailImage] placeholderImage:placeholder];
//            }
//        } else { // 没有网络
//            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:item.thumbnailImage];
//            if (thumbnailImage) { // 内存\沙盒缓存中有小图
//                self.imageView.image = thumbnailImage;
//            } else { // 处理离线状态，而且有没有缓存时的情况
//                self.imageView.image = placeholder;
//            }
//        }
//    }
}
@end
