//
//  BaseAPI.h
//  IBZApp
//
//  Created by yc on 16/5/20.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import "UserService.h"
#import "OrderService.h"
#import "HomeService.h"

@interface BaseAPI : NSObject

@property (strong, nonatomic) HomeService    *homeService;
@property (strong, nonatomic) UserService    *userService;
@property (strong, nonatomic) OrderService   *orderService;

+ (BaseAPI *)sharedAPI;
@end
