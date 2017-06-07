//
//  KGOEatHeaderReusableView.m
//  pxptios
//
//  Created by KingSoft on 2017/6/5.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatHeaderReusableView.h"

@interface KGOEatHeaderReusableView ()
@property (nonatomic, strong)UILabel *kindLB;

@end

@implementation KGOEatHeaderReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatHeader];
    }
    return self;
}

- (void)creatHeader{
    UILabel *kindLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.bounds.size.width - 20, self.bounds.size.height)];
    [self addSubview:kindLB];
    kindLB.font = [UIFont systemFontOfSize:17];
    kindLB.textColor = [UIColor lightGrayColor];
    self.kindLB = kindLB;
}

-(void)setContentStr:(NSString *)contentStr{
    _contentStr = contentStr;
    _kindLB.text = contentStr;
}
@end
