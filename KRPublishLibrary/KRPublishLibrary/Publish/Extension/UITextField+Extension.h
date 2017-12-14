//
//  UITextField+Extension.h
//  Extension
//
//  Created by LX on 2017/12/13.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)size textColor:(UIColor *)textColor keyboardType:(UIKeyboardType)keyboardType;

@end
