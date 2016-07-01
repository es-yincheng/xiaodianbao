//
//  ThreeItemsCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "ThreeItemsCell.h"
#import "WebViewController.h"

@implementation ThreeItemsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithModel:(HomeModel *)model{
    self.homeModel = model;
    [self.icon1 sd_setBackgroundImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:0]] forState:UIControlStateNormal];
        [self.icon2 sd_setBackgroundImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:1]] forState:UIControlStateNormal];
        [self.icon3 sd_setBackgroundImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:2]] forState:UIControlStateNormal];
}


- (IBAction)jumpAction:(UIButton *)sender {
    
    NSString *orignUrl = [self.homeModel.links objectAtIndex:sender.tag - 9000];
    NSString *result;
    if (orignUrl.length > 0) {
         NSArray *array = [orignUrl componentsSeparatedByString:@"http://"]; //从字符A中分隔成2个元素的数组
        if (array.count > 1) {
            NSString *tempStr = [array objectAtIndex:1];
            NSArray *tempArray = [tempStr componentsSeparatedByString:@"&source="];
            
            result = [tempArray objectAtIndex:0];
            
            WebViewController *webVC = [[WebViewController alloc] init];
            webVC.urlString = [NSString stringWithFormat:@"http://%@",result];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        }
    }
}

@end
