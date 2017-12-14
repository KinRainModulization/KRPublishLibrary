//
//  UITextField+Extension.m
//  Extension
//
//  Created by LX on 2017/12/13.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "UITextField+Extension.h"
#import "Macros.h"

@implementation UITextField (Extension)

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)size textColor:(UIColor *)textColor keyboardType:(UIKeyboardType)keyboardType {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:size];
    textField.textColor = textColor;
    textField.keyboardType = keyboardType;
    textField.tintColor = RGB(74,208,237);
    return textField;
}
@end
