//
//  UIView+Extension.m
//  MeiJingXiu
//
//  Created by Cool Time on 16/4/27.
//  Copyright © 2016年 coolshow_Ios. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.x = y;
    self.frame = frame;
}


- (CGFloat)kwidth
{
    return self.frame.size.width;
}
-(void)setKwidth:(CGFloat)kwidth{
    CGRect frame = self.frame;
    frame.size.width = kwidth;
    self.frame = frame;
}

- (CGFloat)kheight
{
    return self.frame.size.height;
}
- (void)setKheight:(CGFloat)kheight
{
    CGRect frame = self.frame;
    frame.size.height = kheight;
    self.frame = frame;
}




- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}



// 中点
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y= centerY;
    self.center = center;
}


// 圆角
- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = YES;
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}
@end
