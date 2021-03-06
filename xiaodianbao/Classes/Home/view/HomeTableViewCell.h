//
//  HomeTableViewCell.h
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) HomeModel *homeModel;

- (void)configCellWithModel:(HomeModel *)model;

@end
