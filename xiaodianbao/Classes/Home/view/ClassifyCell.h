//
//  ClassifyCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface ClassifyCell : UITableViewCell

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *icons;
@property (strong, nonatomic) HomeModel *homeModel;

- (void)configCellWithModel:(HomeModel *)model;

@end
