//
//  BaseViewController.h
//  Yml
//
//  Created by LX on 2017/10/9.
//  Copyright © 2017年 xi. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//不可下拉刷新的视图显示加载按钮
@property (nonatomic, assign) BOOL showReloadBtn;

@property (nonatomic, assign) BOOL hiddenNetworkErrorView;
@end
