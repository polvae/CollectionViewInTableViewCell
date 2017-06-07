//
//  KGOEatDormHeaderView.m
//  pxptios
//
//  Created by KingSoft on 2017/5/7.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatDormHeaderView.h"
#import "Masonry.h"

#define KEatDormHeight 44

@interface KGOEatDormHeaderView()

@property(nonatomic,strong)UILabel *dateLB;

@end

@implementation KGOEatDormHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *dateLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
        dateLB.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        self.dateLB = dateLB;
        dateLB.font = KDefaultBigSize;
        dateLB.textColor = [UIColor blueColor];
        dateLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:dateLB];
        
    }
    return self;
}

-(void)setDateStr:(NSString *)dateStr{
    _dateStr = dateStr;
    self.dateLB.text = dateStr;
}


@end
