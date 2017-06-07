//
//  Header.h
//  CollectionViewInTableViewCell
//
//  Created by KingSoft on 2017/6/6.
//  Copyright © 2017年 KingSoft. All rights reserved.
//

#ifndef Header_h
#define Header_h


//获取屏幕宽高的宏定义
#define KScreenBounds ([UIScreen mainScreen].bounds)
//获取屏幕宽度的宏定义
#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)
//获取屏幕高度的宏定义
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)

//获取任意一个视图的宽度
#define KViewWidth(a) ((a).bounds.size.width)
//获取任意一个视图的高度
#define KViewHeight(a) ((a).bounds.size.height)
//获取任意一个视图的X坐标
#define KViewOrignalX(a) ((a).frame.origin.x)
//获取任意一个视图的Y坐标
#define KViewOrignalY(a) ((a).frame.origin.y)
//设置颜色
#define KColorA(R,G,B,a) ([UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(a)])

#define KColor(R,G,B) ([UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(1.0)])

//================默认设置（NAV导航栏，Tab等)==========================
//默认字体大小
#define KDefaultSize ([UIFont systemFontOfSize:14.0])

//小号字体
#define KDefaultSmalSize ([UIFont systemFontOfSize:15])
//大号字体
#define KDefaultBigSize ([UIFont systemFontOfSize:17])



#endif /* Header_h */
