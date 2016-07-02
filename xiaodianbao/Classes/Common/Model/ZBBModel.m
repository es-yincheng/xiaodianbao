//
//  ZBBModel.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/2.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "ZBBModel.h"

@implementation ZBBModel

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{
    
    if ((1 != [[keyValues yc_objectForKey:@"resultCode"] intValue]) ||
        [keyValues yc_objectForKey:@"data"] == nil ||
        ([keyValues yc_objectForKey:@"data"] == [NSNull null])) {
        
        [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"message"]]];
        return nil;
    }
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dicts in [[keyValues objectForKey:@"data"] objectForKey:@"list"]) {
        ZBBModel *model = [[ZBBModel alloc] init];
        
        model.piccover = [NSString stringWithFormat:@"%@",[[dicts objectForKey:@"data"] objectForKey:@"pic_cover"]];
        model.title = [NSString stringWithFormat:@"%@",[[dicts objectForKey:@"data"] objectForKey:@"title"]];
        model.webUrl = [NSString stringWithFormat:@"%@",[[dicts objectForKey:@"data"] objectForKey:@"url"]];

        NSMutableArray *picturesArray = [[NSMutableArray alloc] init];
        for (NSString *url in [[dicts objectForKey:@"data"] objectForKey:@"pictures"]) {
            [picturesArray addObject:url];
        }
        model.pictures = picturesArray;
        [models addObject:model];
    }
    return models;
}

@end
