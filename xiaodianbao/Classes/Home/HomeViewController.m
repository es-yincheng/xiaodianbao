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
//#import "HomeHeaderCell.h"
//#import "HomeTDCell.h"
//#import "HomeClassifyCell.h"
//#import "HomeFeedsCell.h"

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
    
//    self.tableView.estimatedRowHeight = 200;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//
//    [self.tableView registerNib:[UINib nibWithNibName:@"HomeHeaderCell" bundle:nil] forCellReuseIdentifier:@"HomeHeaderCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTDCell" bundle:nil] forCellReuseIdentifier:@"HomeTDCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"HomeClassifyCell" bundle:nil] forCellReuseIdentifier:@"HomeClassifyCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"HomeFeedsCell" bundle:nil] forCellReuseIdentifier:@"HomeFeedsCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];
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
    NSLog(@"heights:%lu",(unsigned long)self.cellHeights.count);
    return ScreenWith/[[self.cellHeights objectAtIndex:indexPath.row] floatValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HomeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    HomeModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell.imageButton sd_setImageWithURL:[NSURL URLWithString:[model.images objectAtIndex:0]]
                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
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

- (NSMutableArray *)cellHeights{
    if (!_cellHeights) {
        NSArray *tempArray = @[
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",3/1],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/220],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/220],
                               [NSString stringWithFormat:@"%d",1242/20],
                               
                               [NSString stringWithFormat:@"%d",1242/230],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",3/1],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/20],
                               
                               [NSString stringWithFormat:@"%d",1242/230],
                               [NSString stringWithFormat:@"%d",4/1],
                               
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/230],
                               
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               [NSString stringWithFormat:@"%d",1242/20],
                               [NSString stringWithFormat:@"%d",1242/704],
                               ];
        _cellHeights = [[NSMutableArray alloc] initWithArray:tempArray];
    }
    return _cellHeights;
}



@end
