//
//  LXDatePickerView.h
//  KRUser
//
//  Created by LX on 2017/12/21.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^WYBirthdayPickerViewBlock)(NSString *selectedDate);

@interface LXDatePickerView : UIView
@property (strong, nonatomic) WYBirthdayPickerViewBlock confirmBlock;
- (instancetype)initWithInitialDate:(NSString *)initialDate;
@end
