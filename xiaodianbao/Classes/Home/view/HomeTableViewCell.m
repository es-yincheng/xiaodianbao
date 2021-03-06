//
//  HomeTableViewCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "WebViewController.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    UIViewContentModeScaleAspectFit
//    UIViewContentModeScaleToFill,
//    UIViewContentModeScaleAspectFit,
//    UIViewContentModeScaleAspectFill,
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)configCellWithModel:(HomeModel *)model{
    self.homeModel = model;
    [self.imageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:0]]
                                          forState:UIControlStateNormal];
}

- (IBAction)jumpAction:(UIButton *)sender {
    
    NSString *orignUrl = [self.homeModel.links objectAtIndex:sender.tag - 7000];
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
