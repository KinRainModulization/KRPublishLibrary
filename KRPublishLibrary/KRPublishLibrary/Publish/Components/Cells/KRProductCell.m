//
//  KRProductCell.m
//  KRHome
//
//  Created by LX on 2017/12/29.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRProductCell.h"
#import "Macros.h"
#import "Masonry.h"
#import "UIView+Extension.h"
#import "UILabel+Extension.h"
#import "KRCustomPriceView.h"

@interface KRProductCell ()

@property (nonatomic, strong) UIImageView *productImageView;

@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UILabel *productBriefLabel;

@property (nonatomic, strong) KRCustomPriceView *priceView;

@property (nonatomic, strong) UIView *lineView;
@end

@implementation KRProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIView *contentView = [[UIView alloc] init];
    
    [self addSubview:contentView];
    [contentView addSubview:self.productImageView];
    [contentView addSubview:self.productNameLabel];
    [contentView addSubview:self.productBriefLabel];
    [contentView addSubview:self.priceView];
    [contentView addSubview:self.lineView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(10, 11.5, 10, 10));
    }];
    [_productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(contentView);
        make.width.height.mas_equalTo(115);
    }];
    [_productNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(5);
        make.leading.equalTo(_productImageView.mas_trailing).offset(20);
        make.trailing.equalTo(contentView);
    }];
    [_productBriefLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(49);
        make.leading.trailing.equalTo(_productNameLabel);
    }];
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(contentView).offset(-_priceView.width);
        make.bottom.equalTo(contentView).offset(-(20+_priceView.height*0.5));
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(5);
    }];
}

- (void)setCellLineHeight:(CGFloat)cellLineHeight {
    _cellLineHeight = cellLineHeight;
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(cellLineHeight);
    }];
}

- (UIImageView *)productImageView {
    if (!_productImageView) {
        _productImageView = [[UIImageView alloc] init];
        _productImageView.backgroundColor = GLOBAL_COLOR;
    }
    return _productImageView;
}

- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        _productNameLabel = [UILabel labelWithText:@"项目名称" textColor:FONT_COLOR_33 fontSize:14];
        _productNameLabel.numberOfLines = 2;
    }
    return _productNameLabel;
}

- (UILabel *)productBriefLabel {
    if (!_productBriefLabel) {
        _productBriefLabel = [UILabel labelWithText:@"项目介绍" textColor:RGB(128, 128, 128) fontSize:12];
        _productBriefLabel.numberOfLines = 2;
    }
    return _productBriefLabel;
}

- (KRCustomPriceView *)priceView {
    if (!_priceView) {
        _priceView = [KRCustomPriceView customPriceViewWithPrice:@"111.11" integerFontSize:18 decimalFontSize:14];
    }
    return _priceView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    }
    return _lineView;
}

@end

