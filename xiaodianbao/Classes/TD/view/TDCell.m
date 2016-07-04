//
//  TDCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/4.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "TDCell.h"

@implementation TDCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configCellWithModel:(TDModel *)model{
    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:model.picAvatar]];
    self.content.text = [self getContent:model.content];
    for (int x = 0 ; x < self.imageIcon.count ; x ++) {
        if (x < model.pictures.count) {
            UIImageView *tempImage = [self.imageIcon objectAtIndex:x];
            tempImage.layer.masksToBounds = YES;
            tempImage.layer.cornerRadius = 4;
            [tempImage sd_setImageWithURL:[NSURL URLWithString:model.pictures[x]]];
        }
    }
    self.storeName.text = model.storeName;
}

- (NSString *)getContent:(NSString *)content{
    NSString *tempStr = [content copy];
    if (tempStr.length > 60) {
        tempStr = [tempStr substringToIndex:60];
        tempStr = [NSString stringWithFormat:@"%@...",tempStr];
    }
    return tempStr;
}

@end
