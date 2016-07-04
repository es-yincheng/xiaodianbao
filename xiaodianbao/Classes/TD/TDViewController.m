//
//  TDViewController.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/4.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "TDViewController.h"
#import "TDModel.h"
#import "TDCell.h"

@interface TDViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSUInteger pageIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation TDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pageIndex = 0;
    [self setTableView];
    
    [self getMoreData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - custom
- (void)setTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"TDCell" bundle:nil] forCellReuseIdentifier:@"TDCell"];
}

- (IBAction)showAllAction:(UIButton *)sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(sender.tag - 3000) inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)getMoreData{
    [[BaseAPI sharedAPI].homeService getTDDataWithCity:CityShanghai
                                              pageIndex:pageIndex success:^(NSDictionary *resultDict) {
                                                  if (pageIndex == 0) {
                                                      self.dataSource = [TDModel yc_objectWithKeyValues:resultDict];
                                                      [self.tableView reloadData];
                                                  }
                                              } failure:^(NSError *error) {
                                                  
                                              }];
}

#pragma mark - delegate/dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TDCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TDCell"];
    if (indexPath.row % 2 == 0) {
        cell.showButtonHeight.constant = 0.f;
        cell.showButton.hidden = YES;
    } else {
        cell.showButtonHeight.constant = 30.f;
        cell.showButton.hidden = NO;
        cell.tag = 3000 + indexPath.row;
        [cell.showButton addTarget:self action:@selector(showAllAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    [cell configCellWithModel:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - lazy
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
