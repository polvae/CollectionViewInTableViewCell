//
//  KGOEatDormCellModel.m
//  pxptios
//
//  Created by KingSoft on 2017/6/5.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import "KGOEatDormCellModel.h"
#import "NSString+StrHeight.h"

@implementation KGOEatDormCellModel

-(NSMutableArray *)foodWidthArr{
    if (!_foodWidthArr) {
        _foodWidthArr = [NSMutableArray new];
    }
    return _foodWidthArr;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"nr"]) {
        self.foodsArr = [value componentsSeparatedByString:@","];
        for (NSString *food in self.foodsArr) {
            CGFloat foodW = [food boundingStrWidthWithFontSize:15] + 12;
            [self.foodWidthArr addObject:[NSNumber numberWithFloat:foodW]];
        }
    }else{
        [super setValue:value forKey:key];
    }
}


@end
