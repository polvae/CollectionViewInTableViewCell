//
//  KGOEatDormController.m
//  pxptios
//
//  Created by KingSoft on 2017/5/7.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatDormController.h"
#import "KGOEatDormCell.h"
#import "KGOEatDormSectionModel.h"
#import "KGOEatDormCellModel.h"
#import "KGOEatDormHeaderView.h"
#import "Masonry.h"
#import "MJExtension.h"

#define KEatDormCell @"KGOEatDormCell.h"

@interface KGOEatDormController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UITableView *tableView;

@property(nonatomic,strong)NSArray *sectionDataArr;

@end

@implementation KGOEatDormController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI{
    [self requestDate];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [self.tableView registerClass:[KGOEatDormCell class] forCellReuseIdentifier:KEatDormCell];
    self.view.backgroundColor = KColor(243, 247, 251);
    self.tableView.backgroundColor = KColor(243, 247, 251);
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    self.tableView.estimatedRowHeight = 300;
}

- (void)requestDate{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    
    NSData *JSONData = [NSData dataWithContentsOfFile:path];
    
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    NSDictionary *dic = dataArray.firstObject;
    NSArray *dataArr = dic[@"ycxx"];
    self.sectionDataArr = [KGOEatDormSectionModel mj_objectArrayWithKeyValuesArray:dataArr];
    [self.tableView reloadData];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    KGOEatDormHeaderView *sectionHeaderLab =  [[KGOEatDormHeaderView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    KGOEatDormSectionModel *model = self.sectionDataArr[section];
    sectionHeaderLab.dateStr = model.rq;
    return sectionHeaderLab;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 0.01;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionDataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KGOEatDormCell *cell = [self.tableView dequeueReusableCellWithIdentifier:KEatDormCell];
    KGOEatDormSectionModel *model =  self.sectionDataArr[indexPath.section];
    cell.modelArr = model.yc;
    cell.frame = tableView.bounds;
    return cell;
    
}



/**
 关键的方法 （还要优化，在滑动时会出现跳动的情况）
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    UICollectionView* view = [cell.contentView.subviews objectAtIndex:0];
    return view.collectionViewLayout.collectionViewContentSize.height + 20;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
//    [_collectionView setCollectionViewLayout:[self collectionViewFlowLayoutForOrientation:toInterfaceOrientation] animated:YES];
    [self.tableView reloadData];
}
@end
