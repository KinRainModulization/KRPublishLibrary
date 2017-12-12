//
//  BaseViewController.h
//  Yml
//
//  Created by LX on 2017/10/9.
//  Copyright © 2017年 xi. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 隐藏网络错误
 */
@property (nonatomic, assign) BOOL hiddenNetworkErrorView;

/**
 展示空状态视图
 */
- (void)showEmptyViewWithImageSource:(NSString *)imageStr title:(NSString *)title subTitle:(NSString *)subTitle;

@end
