//
//  LXNetworkErrorHeadView.m
//  Yml
//
//  Created by LX on 2017/10/11.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXNetworkErrorHeadView.h"

@interface LXNetworkErrorHeadView ()

@property (nonatomic, strong) UIButton *headErrorBtn;
@property (nonatomic, strong) UIImageView *arrowView;

@end

@implementation LXNetworkErrorHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    [self addSubview:self.headErrorBtn];
    [self.headErrorBtn addSubview:self.arrowView];
    
    _headErrorBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _arrowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_headErrorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.equalTo(@44);
    }];
    [_arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_headErrorBtn).offset(-10);
        make.centerY.equalTo(_headErrorBtn);
    }];
}

- (void)headButtonDidClick {
    self.headErrorBtnClickBlock();
}

#pragma mark - Setter/Getter

- (UIButton *)headErrorBtn {
    if (!_headErrorBtn) {
        _headErrorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headErrorBtn.adjustsImageWhenHighlighted = NO;
        _headErrorBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _headErrorBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _headErrorBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        _headErrorBtn.backgroundColor = RGBA(0, 0, 0, 0.68);
        _headErrorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_headErrorBtn setTitle:@"网络连接失败，请检查您的网络设置" forState:UIControlStateNormal];
        [_headErrorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_headErrorBtn setImage:[UIImage imageNamed:@"error_img"] forState:UIControlStateNormal];
        [_headErrorBtn addTarget:self action:@selector(headButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headErrorBtn;
}

- (UIImageView *)arrowView {
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    }
    return _arrowView;
}

@end
