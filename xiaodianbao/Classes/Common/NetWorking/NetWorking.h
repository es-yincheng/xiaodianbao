//
//  NetWorking.h
//  IBZApp
//
//  Created by yc on 16/5/25.
//  Copyright © 2016年 ibaozhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

typedef void(^SuccessBlock)(NSDictionary *resultDict);
typedef void(^FailureBlock)(NSError *error);


typedef NS_ENUM(NSInteger, NetworkStatus) {
    NetworkStatusUnknown          = -1,
    NetworkStatusNotReachable     = 0,
    NetworkStatusReachableViaWWAN = 1,
    NetworkStatusReachableViaWiFi = 2,
};

@interface NetWorking : NSObject

@property (nonatomic, assign) NetworkStatus status;

@property (nonatomic, copy) SuccessBlock  success;
@property (nonatomic, copy) FailureBlock  failure;

+ (NetWorking *_Nonnull)sharedNetWorking;
+ (NetworkStatus)getNetWorkStatuCode;
+ (NSString *_Nonnull)getNetWorkStatuString;
+ (void)startMonitoring;

-(void)get:(NSString *)method
parameters:(NSDictionary *)parameters
   success:(SuccessBlock)success
   failure:(FailureBlock)failure;

-(void)post:(NSString *)method
 parameters:(NSDictionary *)parameters
    success:(SuccessBlock)success
    failure:(FailureBlock)failure;

@end
