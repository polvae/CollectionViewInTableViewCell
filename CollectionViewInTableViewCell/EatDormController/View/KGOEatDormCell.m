//
//  KGOEatDormCell.m
//  pxptios
//
//  Created by KingSoft on 2017/5/7.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatDormCell.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "KGOEatHeaderReusableView.h"
#import "KGOEatCollectionViewCell.h"
#import "KGOEatDormCellModel.h"
#import "Masonry.h"

#define KEatHeaderReusableView @"KGOEatHeaderReusableView"
#define KEatCollectionViewCell @"KGOEatCollectionViewCell"

@interface KGOEatDormCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray  *foodsArr;
@property (nonatomic, strong) NSArray  *foodsWArr;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)NSArray *typeArr;
@property (nonatomic, strong)UICollectionViewLeftAlignedLayout *flowLayout;

@end

@implementation KGOEatDormCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildSubViews];
        self.backgroundColor = KColor(243, 247, 251);
        self.contentView.frame = self.bounds;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)buildSubViews{

    UICollectionViewLeftAlignedLayout *flowLayout=[[UICollectionViewLeftAlignedLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //设置竖直滚动
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    self.flowLayout = flowLayout;
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[KGOEatCollectionViewCell class] forCellWithReuseIdentifier:KEatCollectionViewCell];
    [self.collectionView registerClass:[KGOEatHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KEatHeaderReusableView];
    [self.contentView addSubview:self.collectionView];
    self.collectionView.cornerRadius = 15;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0);
        make.center.mas_equalTo(self);
        make.width.mas_equalTo(KScreenWidth - 20);
    }];
  }

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KGOEatDormCellModel *model =  self.modelArr[indexPath.section];
    CGFloat foodW = [model.foodWidthArr[indexPath.row] floatValue];
    return  CGSizeMake(foodW, 20);  //设置cell宽高
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,10, 10, 10);
}


#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    KGOEatDormCellModel *oneModel = self.modelArr[section];
    return oneModel.foodsArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.modelArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KGOEatCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:KEatCollectionViewCell forIndexPath:indexPath];
    KGOEatDormCellModel *model = self.modelArr[indexPath.section];
    cell.typeContentStr = model.foodsArr[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    KGOEatHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KEatHeaderReusableView forIndexPath:indexPath];
    KGOEatDormCellModel *model = self.modelArr[indexPath.section];
    headerView.contentStr = [NSString stringWithFormat:@"%@(%@)",model.lx,model.dd] ;
    return headerView;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.kwidth, 44);
}

-(void)setModelArr:(NSArray *)modelArr{
    _modelArr = modelArr;
    [self.collectionView reloadData];
     [self reloadCell];
}

- (void)reloadCell{
    [self.collectionView performBatchUpdates:^{
    } completion:^(BOOL finished) {
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.flowLayout.collectionViewContentSize.height);
            make.width.mas_equalTo(KScreenWidth - 20);
        }];
    }];
}

@end
