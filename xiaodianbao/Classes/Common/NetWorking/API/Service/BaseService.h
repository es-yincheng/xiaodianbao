//
//  BaseService.h
//  IBZApp
//
//  Created by 尹成 on 16/6/13.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSDictionary *resultDict);
typedef void(^FailureBlock)(NSError *error);

@interface BaseService : NSObject

@property (nonatomic, copy) SuccessBlock _Nonnull success;
@property (nonatomic, copy) FailureBlock _Nonnull failure;

@end
