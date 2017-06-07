//
//  NSString+StrHeight.m
//  计算文字高度
//
//  Created by Cool Time on 16/5/5.
//  Copyright © 2016年 PYP. All rights reserved.
//

#import "NSString+StrHeight.h"

@implementation NSString (StrHeight)

- (CGFloat)boundingStrHeightWithFontSize:(CGFloat)fontSize withWidth:(CGFloat)fontWidth{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(fontWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return size.height;
}

- (CGFloat)boundingStrWidthWithFontSize:(CGFloat)fontSize{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return size.width;
}

@end
