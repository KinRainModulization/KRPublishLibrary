//
//  UIButton+Extension.m
//  QuickBooks
//
//  Created by 希 on 16/7/12.
//  Copyright © 2016年 shijiabao. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithImage:(NSString *)imageName spacing:(CGFloat)spacing title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color target:(id)target action:(SEL)action {
    UIButton *button = [self buttonWithTitle:title fontSize:size titleColor:color target:target action:action];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    CGFloat imageWidth = button.imageView.bounds.size.width;
    CGFloat titleWidth = button.titleLabel.bounds.size.width;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+spacing, 0, -(titleWidth+spacing));
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);

    return button;
}

+ (UIButton *)buttonWithCornerRadius:(CGFloat)cornerRadius title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor target:(id)target action:(SEL)action {
    UIButton * button = [self buttonWithTitle:title fontSize:size titleColor:color target:target action:action];
    button.layer.cornerRadius = cornerRadius;
    button.layer.masksToBounds = YES;
    [button setBackgroundColor:bgColor];
    return button;
}

+ (UIButton *)buttonWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor title:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)color backgroundColor:(UIColor *)bgColor target:(id)target action:(SEL)action {
    UIButton * button = [self buttonWithCornerRadius:cornerRadius title:title fontSize:size titleColor:color backgroundColor:bgColor target:target action:action];
    button.layer.borderWidth = 1;
    button.layer.borderColor = borderColor.CGColor;
    return button;
}

@end
