//
//  UIBarButtonItem+Extension.m
//  Extension
//
//  Created by 希 on 16/6/28.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"
#import "UIView+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image withTarget:(id)target withAction:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.size = btn.currentImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:btn];
}

+ (instancetype)itemWithTitle:(NSString *)title withTitleColor:(UIColor *)color withTarget:(id)target withAction:(SEL)action {
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:button];
}
@end
