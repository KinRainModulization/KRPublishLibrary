//
//  LXNetworkErrorView.h
//  Yml
//
//  Created by LX on 2017/10/10.
//  Copyright © 2017年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXNetworkErrorView : UIView

// 不可下拉刷新的视图显示加载按钮
@property (nonatomic, assign) BOOL showReloadBtn;

@property (nonatomic, copy) void (^reloadDataBlock)(void);

@end
