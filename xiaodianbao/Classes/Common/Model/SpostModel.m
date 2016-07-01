//
//  SpostModel.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "SpostModel.h"

@implementation SpostModel

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues{
    
    if ((1 != [[keyValues yc_objectForKey:@"resultCode"] intValue]) ||
        [keyValues yc_objectForKey:@"data"] == nil ||
        ([keyValues yc_objectForKey:@"data"] == [NSNull null])) {
        
        [MBProgressHUD showMessageAuto:[NSString stringWithFormat:@"%@",[keyValues yc_objectForKey:@"message"]]];
        return nil;
    }
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dicts in [[keyValues objectForKey:@"data"] objectForKey:@"list"]) {
        SpostModel *model = [[SpostModel alloc] init];
    
        model.storeId = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"id"]];
        model.titleStr = [dicts objectForKey:@"store_name"];
        model.descripStr = [NSString stringWithFormat:@"%@ %@",[dicts objectForKey:@"main_category"],[dicts objectForKey:@"sub_category"]];
        model.discountStr = [NSString stringWithFormat:@"%@",[dicts objectForKey:@"discount"]];
        model.image1Url = [[dicts objectForKey:@"pic_covers"] objectAtIndex:0];
        model.image2Url = [[dicts objectForKey:@"pic_covers"] objectAtIndex:1];
        model.image3Url = [[dicts objectForKey:@"pic_covers"] objectAtIndex:2];
        model.textStr = [dicts objectForKey:@"title"];
        model.postTitleStr = [[[dicts yc_objectForKey:@"posts"] yc_objectAtIndex:0] yc_objectForKey:@"title"];
        model.postsUrl = [[[dicts yc_objectForKey:@"posts"] yc_objectAtIndex:0] yc_objectForKey:@"link"];
        
        [models addObject:model];
    }
    return models;
}

@end
