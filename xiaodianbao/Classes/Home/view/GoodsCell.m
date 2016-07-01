//
//  GoodsCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "GoodsCell.h"
#import "WebViewController.h"
#import "UIImage+WebP.h"

@implementation GoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.yuyue.layer.masksToBounds = YES;
    self.yuyue.layer.cornerRadius = 4;
    self.yuyue.layer.borderWidth = 0.8;
    self.yuyue.layer.borderColor = [UIColor colorWithRed:0.949 green:0.235 blue:0.271 alpha:1.000].CGColor;
    
    self.image1.layer.masksToBounds = YES;
    self.image1.layer.cornerRadius = 4;
    
    self.image2.layer.masksToBounds = YES;
    self.image2.layer.cornerRadius = 4;
    
    self.image3.layer.masksToBounds = YES;
    self.image3.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configCellWithModel:(SpostModel *)model{
    self.spostModel = model;
    
    self.titleLb.text = model.titleStr;
    self.descripLb.text = model.descripStr;
    if (model.discountStr.length > 0) {
        self.discountLb.text = model.discountStr;
        self.discountIcon.hidden = NO;
    } else {
        self.discountLb.text = nil;
        self.discountIcon.hidden = YES;
    }

    
    
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:model.image1Url]];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:model.image2Url]];
    [self.image3 sd_setImageWithURL:[NSURL URLWithString:model.image3Url]];
    self.textLb.text = model.textStr;
    self.postsTitlLb.text = model.postTitleStr;
    
}

- (IBAction)jumpAction:(id)sender {
            
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.urlString = self.spostModel.postsUrl;
    [self.viewController.navigationController pushViewController:webVC animated:YES];
}
@end
