//
//  TDCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/4.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDModel.h"

@interface TDCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showButtonHeight;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *storeName;

- (void)configCellWithModel:(TDModel *)model;

@end
