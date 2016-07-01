//
//  GoodsViewController.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "GoodsViewController.h"
#import "WebViewController.h"
#import "GoodsCell.h"
#import "SpostModel.h"

@interface GoodsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataSource;

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[BaseAPI sharedAPI].homeService getSpotsDataWithCity:CityShanghai
                                                 distance:nil
                                                 category:nil
                                                 success:^(NSDictionary *resultDict) {
                                                     NSMutableArray *models = [SpostModel yc_objectWithKeyValues:resultDict];
                                                     self.dataSource = models;
                                                     [self.tableView reloadData];
                                                 } failure:^(NSError *error) {
                                                     NSLog(@"error:\n%@",error);
                                                 }];
    

    [self setTableView];
}

- (void)setTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellReuseIdentifier:@"GoodsCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GoodsCell"];
    [cell configCellWithModel:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    http://www.ushopal.com/api/v2/cstore/store_card_info?city_id=1&project_code=blackwidow&store_id=1431&version=2.0.7
    SpostModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [[BaseAPI sharedAPI].homeService getStoreDataWithCity:CityShanghai
                                                  storeId:model.storeId
                                                  success:^(NSDictionary *resultDict) {
                                                      
                                                      if ([[resultDict yc_objectForKey:@"data"] yc_objectForKey:@"shared_url"]) {
                                                          NSString *webUrl = [[resultDict yc_objectForKey:@"data"] yc_objectForKey:@"shared_url"];
                                                          WebViewController *webVC = [[WebViewController alloc] init];
                                                          webVC.urlString = webUrl;
                                                          [self.navigationController pushViewController:webVC animated:YES];
                                                      }
                                                  } failure:^(NSError *error) {
                                                      NSLog(@"error:%@",error);
                                                  }];
    
    
}





















- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
