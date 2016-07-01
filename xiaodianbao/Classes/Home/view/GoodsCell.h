//
//  GoodsCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpostModel.h"

@interface GoodsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *descripLb;
@property (weak, nonatomic) IBOutlet UIImageView *discountIcon;
@property (weak, nonatomic) IBOutlet UILabel *discountLb;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UILabel *textLb;
@property (weak, nonatomic) IBOutlet UILabel *postsTitlLb;
@property (weak, nonatomic) IBOutlet UIButton *storeButton;

@property (weak, nonatomic) IBOutlet UILabel *yuyue;

@property (strong, nonatomic) SpostModel *spostModel;

- (void)configCellWithModel:(SpostModel *)model;

@end
