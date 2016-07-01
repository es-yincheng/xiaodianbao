//
//  HomeModel.h
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSArray  *images;
@property (nonatomic, strong) NSArray  *links;

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues;

@end
