//
//  TDModel.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/4.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDModel : NSObject

@property (nonatomic, copy  ) NSString *content;
@property (nonatomic, copy  ) NSString *storeName;
@property (nonatomic, copy)  NSString *picAvatar;//userIcon
@property (nonatomic, copy  ) NSString *webUrl;
@property (nonatomic, strong) NSArray  *pictures;

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues;

@end
