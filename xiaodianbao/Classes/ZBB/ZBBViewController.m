//
//  ZBBViewController.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/2.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "ZBBViewController.h"
#import "WebViewController.h"
#import "ZBBCell.h"

@interface ZBBViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger pageIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ZBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pageIndex = 0;
    
    [self getMoreData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)getMoreData{
    [[BaseAPI sharedAPI].homeService getZBBDataWithCity:CityShanghai
                                              pageIndex:pageIndex success:^(NSDictionary *resultDict) {
                                                  
                                              } failure:^(NSError *error) {
                                                  
                                              }];
}

- (void)setTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight  = 500;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBBCell" bundle:nil] forCellReuseIdentifier:@"ZBBCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBBCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ZBBCell"];
    [cell configCellWithModel:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBBModel *model = [self.dataSource objectAtIndex:indexPath.row];
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.urlString = model.webUrl;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
