//
//  HomeService.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeService.h"
#import "NetWorking.h"

@implementation HomeService

- (void)getHomeDataWithCity:(City)city success:(SuccessBlock)success failure:(FailureBlock)failure{
    NSString *string;
    switch (city) {
        case CityShanghai:
            string = [NSString stringWithFormat:@"http://www.ushopal.com/api/v3/c-client/store-operating-config?city_id=-%d&project_code=blackwidow&version=2.0.7",1];
            break;
            
        default:
            string = [NSString stringWithFormat:@"http://www.ushopal.com/api/v3/c-client/store-operating-config?city_id=%d&project_code=blackwidow&version=2.0.7",2];
            break;
    }
    
    [[NetWorking sharedNetWorking] get:string
                             parameters:nil
                                success:success
                                failure:failure];
}

@end
