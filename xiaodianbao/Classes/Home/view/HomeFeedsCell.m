//
//  HomeFeedsCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeFeedsCell.h"
#import "HomeFeedCell.h"

@implementation HomeFeedsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setTableView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeFeedCell" bundle:nil] forCellReuseIdentifier:@"HomeFeedCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeFeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeFeedCell"];
    
    return cell;
}

@end
