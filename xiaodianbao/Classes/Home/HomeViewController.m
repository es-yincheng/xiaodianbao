//
//  HomeViewController.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "ThreeItemsCell.h"
#import "ClassifyCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) City city;
@property (nonatomic, strong) NSMutableArray *cellHeights;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO: 根据定位信息确认
    self.city = CityShanghai;
    
    [[BaseAPI sharedAPI].homeService getHomeDataWithCity:self.city
                                                 success:^(NSDictionary *resultDict) {
                                                     NSMutableArray *models = [HomeModel yc_objectWithKeyValues:resultDict];
                                                     self.dataSource = models;
                                                     [self.tableView reloadData];
                                                 } failure:^(NSError *error) {
                                                     NSLog(@"error:\n%@",error);
                                                 }];
    
    [self setNavigationItem];
    [self setTableView];
}

- (void)setNavigationItem{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_logo_21x21_"]
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(searchAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setTableView{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];

    [self.tableView registerNib:[UINib nibWithNibName:@"ThreeItemsCell" bundle:nil] forCellReuseIdentifier:@"ThreeItemsCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ClassifyCell" bundle:nil]
         forCellReuseIdentifier:@"ClassifyCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - custome 
- (void)searchAction{
    NSLog(@"search!");
}

#pragma mark - delegate/dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self.cellHeights objectAtIndex:indexPath.row] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel *model = [self.dataSource objectAtIndex:indexPath.row];
    if (model.images.count == 3) {
        ThreeItemsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ThreeItemsCell"];
        [cell configCellWithModel:model];
        return cell;
    }
    
    else if (model.images.count == 8){
        ClassifyCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ClassifyCell"];
        cell.backgroundColor = ((NSInteger)indexPath.row % 2 == 0 ? [UIColor lightGrayColor] : [UIColor whiteColor]);
        [cell configCellWithModel:model];
        return cell;
    }
    
    else {
        HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
        cell.backgroundColor = ((NSInteger)indexPath.row % 2 == 0 ? [UIColor lightGrayColor] : [UIColor whiteColor]);
        [cell configCellWithModel:model];
        return cell;
    }
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

- (NSMutableArray *)cellHeights{
    if (!_cellHeights) {

        NSArray *tempArray = @[
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith/3],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*220/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*220/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*230/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith/3],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*230/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith/2],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*230/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*20/1242],
                               [NSString stringWithFormat:@"%lf",ScreenWith*704/1242],
                               ];
        _cellHeights = [[NSMutableArray alloc] initWithArray:tempArray];
    }
    return _cellHeights;
}



@end
