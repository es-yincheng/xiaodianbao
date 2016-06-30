//
//  HomeService.h
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "BaseService.h"

typedef enum : NSUInteger {
    CityShanghai,
    CityBeijing,
} City;

@interface HomeService : BaseService
//http://www.ushopal.com/api/v3/c-client/store-operating-config?city_id=-1&project_code=blackwidow&version=2.0.7
//http://www.ushopal.com/api/v3/c-client/store-operating-config?city_id=2&project_code=blackwidow&version=2.0.7

- (void)getHomeDataWithCity:(City)city
                    success:(SuccessBlock)success
                    failure:(FailureBlock)failure;

@end