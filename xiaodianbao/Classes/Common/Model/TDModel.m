//
//  TDModel.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/4.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "TDModel.h"

@implementation TDModel

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{
    
    if ((1 != [[keyValues yc_objectForKey:@"resultCode"] intValue]) ||
        [keyValues yc_objectForKey:@"data"] == nil ||
        ([keyValues yc_objectForKey:@"data"] == [NSNull null])) {
        
        [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"message"]]];
        return nil;
    }
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dicts in [[keyValues objectForKey:@"data"] objectForKey:@"list"]) {
        TDModel *model = [[TDModel alloc] init];
        
        model.content = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"content"]];
        model.picAvatar = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"picAvatar"]];
        model.storeName = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"storeName"]];
//        model.webUrl = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"content"]];
        
        NSMutableArray *picturesArray = [[NSMutableArray alloc] init];
        for (NSString *url in [dicts objectForKey:@"pictures"]) {
            [picturesArray addObject:url];
        }
        model.pictures = picturesArray;
        [models addObject:model];
    }
    return models;
}

@end
