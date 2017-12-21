//
//  LXCustomPickerView.h
//  KRUser
//
//  Created by LX on 2017/12/21.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXCustomPickerView : UIView

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) NSString *defaultStr;

@property (nonatomic, copy) void (^valueDidSelect)(NSString * value);

+ (instancetype)pickerViewWithDataSource:(NSArray *)dataSource defaultStr:(NSString *)defaultStr valueDidSelect:(void (^)(NSString * value))selectValue;

- (void)show;

@end
