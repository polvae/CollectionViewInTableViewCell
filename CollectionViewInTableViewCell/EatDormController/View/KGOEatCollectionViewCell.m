//
//  KGOEatCollectionViewCell.m
//  pxptios
//
//  Created by KingSoft on 2017/6/5.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatCollectionViewCell.h"

@interface KGOEatCollectionViewCell ()

@property (nonatomic, strong)UIButton *typeBtn;

@end

@implementation KGOEatCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildSubView];
    }
    return self;
}

- (void)buildSubView{
    UIButton *typeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, self.bounds.size.height)];
    [typeBtn setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
    typeBtn.backgroundColor = [UIColor whiteColor];
    typeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    typeBtn.cornerRadius = 5.0;
    [self.contentView  addSubview:typeBtn];
    self.typeBtn = typeBtn;
    typeBtn.layer.borderWidth = 1;
    typeBtn.layer.borderColor =  KColor(206, 219, 251).CGColor;
}

-(void)setTypeContentStr:(NSString *)typeContentStr{
    _typeContentStr = typeContentStr;
    [self.typeBtn setTitle:typeContentStr forState:UIControlStateNormal];
}

-(void)layoutSubviews{
    self.typeBtn.frame = CGRectMake(0, 0, self.kwidth, self.kheight);
}

@end
