//
//  BaseViewController.m
//  Yml
//
//  Created by LX on 2017/10/9.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "BaseViewController.h"
#import "LXNetworkSolutionController.h"
#import "LXNetworkErrorView.h"

@interface BaseViewController ()

@property (nonatomic, strong) LXNetworkErrorView *networkErrorView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    [self.view addSubview:self.networkErrorView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![NetworkTool checkNetwork]) {
            [self.view bringSubviewToFront:_networkErrorView];
            self.networkErrorView.hidden = NO;
        }
    });
    
    [self loadData];
}

// 子类重写父类方法
- (void)loadData {
}

#pragma mark - Setter/Getter

- (void)setHiddenNetworkErrorView:(BOOL)hiddenNetworkErrorView {
    _hiddenNetworkErrorView = hiddenNetworkErrorView;
    _networkErrorView.hidden = YES;
}

- (UIView *)networkErrorView {
    if (!_networkErrorView) {
        _networkErrorView = [[LXNetworkErrorView alloc] initWithFrame:self.view.bounds];
        _networkErrorView.hidden = YES;
        __weak typeof(self) weakSelf = self;
        _networkErrorView.reloadDataBlock = ^{
            [weakSelf loadData];
        };
        _networkErrorView.networkSolutionBlock = ^{
            [weakSelf.navigationController pushViewController:[[LXNetworkSolutionController alloc] init] animated:YES];
        };
    }
    return _networkErrorView;
}

@end
