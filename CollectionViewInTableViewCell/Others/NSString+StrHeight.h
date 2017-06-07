//
//  NSString+StrHeight.h
//  计算文字高度
//
//  Created by Cool Time on 16/5/5.
//  Copyright © 2016年 PYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (StrHeight)
/**
 *  计算文本的高度
 *
 *  @param fontSize  字体的大小
 *  @param fontWidth 放置的宽度
 *
 *  @return 返回文字的高度
 */
- (CGFloat)boundingStrHeightWithFontSize:(CGFloat)fontSize withWidth:(CGFloat)fontWidth;

/**
 *  计算一行时 字符串所占的宽度
 *
 *  @param fontSize 字体大小
 *
 *  @return 宽度
 */
- (CGFloat)boundingStrWidthWithFontSize:(CGFloat)fontSize;

@end
