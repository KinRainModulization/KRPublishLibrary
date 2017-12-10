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
#import "LXNetworkErrorHeadView.h"

@interface BaseViewController ()

@property (nonatomic, strong) LXNetworkErrorView *networkErrorView;
@property (nonatomic, strong) LXNetworkErrorHeadView *networkErrorHeadView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    [self.view addSubview:self.networkErrorView];
    [self.view addSubview:self.networkErrorHeadView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![NetworkTool checkNetwork]) {
            _networkErrorHeadView.hidden = NO;
            _networkErrorView.hidden = NO;
        }
    });
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkStateChange:)
                                                 name:kNotificationNetworkStateChange object:nil];
    
    [self loadData];
}

// 子类重写父类方法
- (void)loadData {
}

#pragma mark - Notification

- (void)handleNetworkStateChange:(NSNotification *)notification {
    [self.view bringSubviewToFront:_networkErrorView];
    [self.view bringSubviewToFront:_networkErrorHeadView];
    BOOL networkState = [notification.userInfo[@"networkStatus"] boolValue];
    _networkErrorHeadView.hidden = networkState;
}

#pragma mark - Setter/Getter

- (void)setHiddenNetworkErrorView:(BOOL)hiddenNetworkErrorView {
    _hiddenNetworkErrorView = hiddenNetworkErrorView;
    _networkErrorView.hidden = YES;
}

- (void)setShowReloadBtn:(BOOL)showReloadBtn {
    _showReloadBtn = showReloadBtn;
    self.networkErrorView.showReloadBtn = showReloadBtn;
}

- (UIView *)networkErrorView {
    if (!_networkErrorView) {
        _networkErrorView = [[LXNetworkErrorView alloc] initWithFrame:self.view.bounds];
        _networkErrorView.hidden = YES;
        __weak typeof(self) weakSelf = self;
        _networkErrorView.reloadDataBlock = ^{
            [weakSelf loadData];
        };
    }
    return _networkErrorView;
}

- (LXNetworkErrorHeadView *)networkErrorHeadView {
    if (!_networkErrorHeadView) {
        _networkErrorHeadView = [[LXNetworkErrorHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _networkErrorHeadView.hidden = YES;
        __weak typeof(self) weakSelf = self;
        _networkErrorHeadView.headErrorBtnClickBlock = ^{
            [weakSelf.navigationController pushViewController:[[LXNetworkSolutionController alloc] init] animated:YES];
        };
    }
    return _networkErrorHeadView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
