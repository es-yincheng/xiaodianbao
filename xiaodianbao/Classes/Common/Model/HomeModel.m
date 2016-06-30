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
            NSMutableArray *tempArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in [dicts objectForKey:@"items"]) {
               [tempArray addObject:[[dict objectForKey:@"image"] objectForKey:@"url"]];
            }
            model.images = tempArray;
            
            if (model.images.count > 1) {
                model.height = ScreenWith/3;
            }
            if ([[dicts objectForKey:@"type"] isEqualToString:@"2"] ||
                [[dicts objectForKey:@"type"] integerValue] == 2) {
                model.height = ScreenWith*704/1242;
            }
            if ([[dicts objectForKey:@"type"] isEqualToString:@"5"] ||
                [[dicts objectForKey:@"type"] integerValue] == 5) {
                model.height = ScreenWith*20/1242;
            }
            
            [models addObject:model];
        }
    return models;
}

@end
