//
//  ZBBModel.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/2.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBBModel : NSObject

@property (nonatomic, copy  ) NSString *piccover;
@property (nonatomic, copy  ) NSString *title;
@property (nonatomic, copy  ) NSString *webUrl;
@property (nonatomic, strong) NSArray  *pictures;

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues;


@end
