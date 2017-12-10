//
//  LXNetworkErrorView.m
//  Yml
//
//  Created by LX on 2017/10/10.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXNetworkErrorView.h"

@interface LXNetworkErrorView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *errorImageView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) UIButton *reloadBtn;

@end

@implementation LXNetworkErrorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.errorImageView];
    [self.containerView addSubview:self.topLabel];
    [self.containerView addSubview:self.bottomLabel];
    [self.containerView addSubview:self.reloadBtn];
    
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    _errorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _reloadBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self);
    }];
    [_errorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.centerY.equalTo(_containerView).offset(-100);
    }];
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_errorImageView.mas_bottom).offset(16);
    }];
    [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_topLabel.mas_bottom).offset(8);
    }];
    [_reloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_bottomLabel.mas_bottom).offset(28);
        make.width.equalTo(@103);
        make.height.equalTo(@34);
    }];
}

- (void)reloadButtonDidClick {
    self.reloadDataBlock();
}

#pragma mark - Setter/Getter

- (void)setShowReloadBtn:(BOOL)showReloadBtn {
    _showReloadBtn = showReloadBtn;
    self.userInteractionEnabled = YES;
    self.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    _reloadBtn.hidden = NO;
    _bottomLabel.text = @"请检查您的网络";
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

- (UIImageView *)errorImageView {
    if (!_errorImageView) {
        _errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"network_error"]];
    }
    return _errorImageView;
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [UILabel labelWithText:@"网络无法连接" textColor:UIColorFromHex(0x666666) fontSize:18];
    }
    return _topLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [UILabel labelWithText:@"请检查您的网络，下拉刷新" textColor:UIColorFromHex(0xc0c0c0) fontSize:13];
    }
    return _bottomLabel;
}

- (UIButton *)reloadBtn {
    if (!_reloadBtn) {
        _reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _reloadBtn.backgroundColor = UIColorFromHex(0xf0f0f0);
        [_reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        [_reloadBtn setTitleColor:UIColorFromHex(0x666666)  forState:UIControlStateNormal];
        _reloadBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _reloadBtn.layer.borderColor = UIColorFromHex(0xe2e2e2).CGColor;
        _reloadBtn.layer.borderWidth = 0.5;
        _reloadBtn.layer.cornerRadius = 3;
        _reloadBtn.hidden = YES;
        [_reloadBtn addTarget:self action:@selector(reloadButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadBtn;
}

@end
