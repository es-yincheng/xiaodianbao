//
//  ZBBCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/2.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "ZBBCell.h"

@implementation ZBBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configCellWithModel:(ZBBModel *)model{
    [self.piccover sd_setImageWithURL:[NSURL URLWithString:model.piccover]];
    self.title.text = model.title;
    for (int x = 0; x < model.pictures.count; x ++) {
        if (x < self.pictures.count) {
            UIImageView *imageView = [self.pictures objectAtIndex:x];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[model.pictures objectAtIndex:x]]];
        }
    }
}

@end
