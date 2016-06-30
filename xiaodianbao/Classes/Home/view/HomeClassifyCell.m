//
//  HomeClassifyCell.m
//  xiaodianbao
//
//  Created by 尹成 on 16/6/30.
//  Copyright © 2016年 尹成. All rights reserved.
//

#import "HomeClassifyCell.h"
#import "HomeClassifyCollectionCell.h"
#import "UIButton+WebCache.h"

@implementation HomeClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    

    [self setCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setCollectionView{
    self.layout.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)/4, CGRectGetWidth([UIScreen mainScreen].bounds)/4);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeClassifyCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HomeClassifyCollectionCell"];
}

#pragma mark - delegate/dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeClassifyCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"HomeClassifyCollectionCell" forIndexPath:indexPath];
    
    [cell.imageButton sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal];
    
    return cell;
}

@end
