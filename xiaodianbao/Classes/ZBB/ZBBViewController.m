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
#import "ZBBModel.h"

@interface ZBBViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger pageIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ZBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTableView];
    
    pageIndex = 0;
    
    [self getMoreData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)getMoreData{
    [[BaseAPI sharedAPI].homeService getZBBDataWithCity:CityShanghai
                                              pageIndex:pageIndex success:^(NSDictionary *resultDict) {
                                                  if (pageIndex == 0) {
                                                      self.dataSource = [ZBBModel yc_objectWithKeyValues:resultDict];
                                                      [self.tableView reloadData];
                                                  }
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
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:webVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
