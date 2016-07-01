//
//  SpostModel.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpostModel : NSObject

@property (nonatomic, copy) NSString *storeId;

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *descripStr;
@property (nonatomic, copy) NSString *discountStr;
@property (nonatomic, copy) NSString *image1Url;
@property (nonatomic, copy) NSString *image2Url;
@property (nonatomic, copy) NSString *image3Url;
@property (nonatomic, copy) NSString *textStr;
@property (nonatomic, copy) NSString *postTitleStr;

@property (nonatomic, copy) NSString *postsUrl;

+ (NSMutableArray *)yc_objectWithKeyValues:(id)keyValues;

@end
