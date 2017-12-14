//
//  UIBarButtonItem+Extension.h
//  Extension
//
//  Created by 希 on 16/6/28.
//  Copyright © 2016年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image withTarget:(id)target withAction:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title withTitleColor:(UIColor *)color withTarget:(id)target withAction:(SEL)action;

@end
