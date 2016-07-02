//
//  ZBBCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/7/2.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBBModel.h"

@interface ZBBCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *piccover;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *pictures;

- (void)configCellWithModel:(ZBBModel *)model;

@end
