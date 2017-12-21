//
//  KRArrowIconRowView.h
//  KRUser
//
//  Created by LX on 2017/12/18.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRArrowIconRowView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *iconImgName;
@property (nonatomic, weak) UIView *subIconView;

+ (instancetype)rowViewWithSize:(CGSize)size title:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden;

@end
