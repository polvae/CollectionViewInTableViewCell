//
//  KGOEatDormCellModel.h
//  pxptios
//
//  Created by KingSoft on 2017/6/5.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KGOEatDormCellModel : NSObject

@property (nonatomic, copy)NSString *nr ;// : "烧饼,牛奶,馒头",
@property (nonatomic, copy)NSString *lx ;//: "早餐",
@property (nonatomic, copy)NSString *dd ;//: "一食堂",
@property (nonatomic, copy)NSString *dm ;
@property (nonatomic, strong)NSArray *foodsArr;
@property (nonatomic, strong)NSMutableArray *foodWidthArr;

@end
