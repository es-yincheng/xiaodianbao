//
//  HomeModel.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeModel.h"
#import "MJExtension.h"

@implementation HomeModel

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{

        if ((1 != [[keyValues yc_objectForKey:@"resultCode"] intValue]) ||
            [keyValues yc_objectForKey:@"data"] == nil ||
            ([keyValues yc_objectForKey:@"data"] == [NSNull null])) {
            
            [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"message"]]];
            return nil;
        }
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
        for (NSDictionary *dicts in [keyValues objectForKey:@"data"]) {
            HomeModel *model = [[HomeModel alloc] init];
            model.type = [[dicts objectForKey:@"type"] integerValue];
            NSMutableArray *tempArray = [[NSMutableArray alloc] init];
            NSMutableArray *templinks = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in [dicts objectForKey:@"items"]) {
               [tempArray addObject:[[dict objectForKey:@"image"] objectForKey:@"url"]];
                [templinks addObject:[dict objectForKey:@"scheme"]];
            }
            model.images = tempArray;
            model.links = templinks;

            [models addObject:model];
        }
    return models;
}

@end
