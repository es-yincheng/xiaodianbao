//
//  ThreeItemsCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface ThreeItemsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *icon1;
@property (weak, nonatomic) IBOutlet UIButton *icon2;
@property (weak, nonatomic) IBOutlet UIButton *icon3;
@property (strong, nonatomic) HomeModel *homeModel;

- (void)configCellWithModel:(HomeModel *)model;

@end
