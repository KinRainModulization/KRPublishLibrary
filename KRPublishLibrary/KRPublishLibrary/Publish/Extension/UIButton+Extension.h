//
//  UIButton+Extension.h
//  Extension
//
//  Created by 希 on 16/7/12.
//  Copyright © 2016年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color target:(id)target action:(SEL)action;
/**
 *  文左图右
 */
+ (UIButton *)buttonWithImage:(NSString *)imageName spacing:(CGFloat)spacing title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color target:(id)target action:(SEL)action;
/**
 *  圆角
 */
+ (UIButton *)buttonWithCornerRadius:(CGFloat)cornerRadius title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor target:(id)target action:(SEL)action;
/**
 *  圆角边框
 */
+ (UIButton *)buttonWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor target:(id)target action:(SEL)action;
@end
