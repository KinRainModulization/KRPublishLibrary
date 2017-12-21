//
//  KRArrowIconRowView.m
//  KRUser
//
//  Created by LX on 2017/12/18.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRArrowIconRowView.h"

@interface KRArrowIconRowView()

@property (nonatomic, assign) BOOL hiddenArrow;// default is NO

@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *arrowImgView;

@end

@implementation KRArrowIconRowView

+ (instancetype)rowViewWithSize:(CGSize)size title:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden {
    KRArrowIconRowView *rowView = [[KRArrowIconRowView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height) title:title subtitle:subTitle iconName:imgName hiddenArrow:isHidden];
    return rowView;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden {
    if (self = [super initWithFrame:frame]) {
        self.title = title;
        self.subTitle = subTitle;
        self.iconImgName = imgName;
        self.hiddenArrow = isHidden;
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = NO;

    UIView *contentView = [[UIView alloc] initWithFrame:self.frame];
    _contentView = contentView;
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(self).offset(12);
        make.trailing.equalTo(self).offset(-12);
    }];
    
    if (self.iconImgName) {
        self.iconImgView.image = [UIImage imageNamed:_iconImgName];
        [contentView addSubview:self.iconImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.centerY.equalTo(contentView);
        }];
    }
    
    if (self.title.length) {
        self.titleLable.text = _title;
        [contentView addSubview:self.titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(contentView).offset(self.iconImgName.length ? _iconImgView.image.size.width + 12 : 0);
            make.centerY.equalTo(contentView);
        }];
    }
    
    if (!self.hiddenArrow) {
        [contentView addSubview:self.arrowImgView];
        [_arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.centerY.equalTo(contentView);
        }];
    }
    
    if (self.subTitle.length) {
        self.subtitleLabel.text = _subTitle;
        [contentView addSubview:self.subtitleLabel];
        [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(contentView).offset(self.hiddenArrow ? 0 : -28);
            make.centerY.equalTo(contentView);
        }];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLable.text = title;
}

- (void)setSubTitle:(NSString *)subTitle {
    _subTitle = subTitle;
    self.subtitleLabel.text = subTitle;
}

- (void)setSubIconView:(UIView *)subIconView {
    _subIconView = subIconView;
    MLog(@"%@",NSStringFromCGRect(subIconView.frame));
    [self.contentView addSubview:subIconView];
    [subIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_contentView).offset(self.hiddenArrow ? 0 : -28);
        make.centerY.equalTo(_contentView);
        make.size.mas_equalTo(CGSizeMake(subIconView.width, subIconView.height));
    }];
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
    }
    return _iconImgView;
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [UILabel labelWithText:@"" textColor:RGB(51, 51, 51) fontSize:14];
    }
    return _titleLable;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [UILabel labelWithText:@"" textColor:RGB(153, 153, 153) fontSize:12];
    }
    return _subtitleLabel;
}

- (UIImageView *)arrowImgView {
    if (!_arrowImgView) {
        _arrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowImgView;
}

@end
