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

- (void)getSpotsDataWithCity:(City)city
                    distance:(NSString *)distance
                    category:(NSString *)category
                     success:(SuccessBlock)success
                     failure:(FailureBlock)failure{
    NSString *string = @"http://www.ushopal.com/api/v2/cstore/search?city_id=1&main_category=%E5%A5%B3%E8%A3%85&next_start=0&project_code=blackwidow&version=2.0.7";
    
//    http://www.ushopal.com/api/v2/cstore/search?city_id=1&latitude=31.169073&lbs_distance=10km&longitude=121.410358&main_category=%E5%A5%B3%E8%A3%85&next_start=0&project_code=blackwidow&tag_people=%E5%A4%A7%E7%89%8C%E4%B8%89%E4%BA%94%E7%99%BE&version=2.0.7
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
//    [dict setValue:@"1" forKey:@"city_id"];
//    [dict setValue:@"31.169073" forKey:@"latitude"];
//    [dict setValue:@"10km" forKey:@"lbs_distance"];
//    [dict setValue:@"121.410358" forKey:@"longitude"];
//    [dict setValue:@"1" forKey:@"main_category"];//类别
//    [dict setValue:@"1" forKey:@"next_start"];//页码
//    [dict setValue:@"blackwidow" forKey:@"project_code"];
//    [dict setValue:@"1" forKey:@"tag_feature"];//特色
//    [dict setValue:@"1" forKey:@"tag_situation"];//环境
//    [dict setValue:@"1" forKey:@"tag_people"];//性价比
//    [dict setValue:@"2.0.7" forKey:@"version"];

    
    
    
    [[NetWorking sharedNetWorking] get:string
                            parameters:nil
                               success:success
                               failure:failure];
}

- (void)getStoreDataWithCity:(City)city storeId:(NSString *)sotreId success:(SuccessBlock)success failure:(FailureBlock)failure{
//    1431&version=
    NSString *string = [NSString stringWithFormat:@"http://www.ushopal.com/api/v2/cstore/store_card_info?city_id=1&project_code=blackwidow&store_id=%@&version=2.0.7",sotreId];
    [[NetWorking sharedNetWorking] get:string
                            parameters:nil
                               success:success
                               failure:failure];
}

@end
