//
//  ClassifyCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "ClassifyCell.h"
#import "GoodsViewController.h"

@implementation ClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithModel:(HomeModel *)model{
    self.homeModel = model;
    for (int x = 0; x < self.icons.count; x ++) {
        UIButton *icon = [self.icons objectAtIndex:x];
        [icon sd_setBackgroundImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:x]]
                forState:UIControlStateNormal];
    }
}

- (IBAction)jumpAction:(UIButton *)sender {
    
    NSString *orignUrl = [self.homeModel.links objectAtIndex:sender.tag - 8000];
    NSString *result;
    if (orignUrl.length > 0) {
        NSLog(@"WebUrl:%@",orignUrl);
        NSArray *array = [orignUrl componentsSeparatedByString:@"http://"]; //从字符A中分隔成2个元素的数组
        if (array.count > 1) {
            NSString *tempStr = [array objectAtIndex:1];
            NSArray *tempArray = [tempStr componentsSeparatedByString:@"&source="];
            
            result = [tempArray objectAtIndex:0];
            
            GoodsViewController *webVC = [[GoodsViewController alloc] init];
            webVC.searchKey = [NSString stringWithFormat:@"%@",result];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        } else {
            GoodsViewController *webVC = [[GoodsViewController alloc] init];
            webVC.searchKey = [NSString stringWithFormat:@"%@",orignUrl];
            [self.viewController.navigationController pushViewController:webVC animated:YES];

        }
    }
}

@end
