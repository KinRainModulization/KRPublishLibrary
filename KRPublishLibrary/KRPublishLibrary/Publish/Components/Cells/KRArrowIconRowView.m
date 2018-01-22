//
//  KRArrowIconRowView.m
//  KRUser
//
//  Created by LX on 2017/12/18.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRArrowIconRowView.h"
#import "Masonry.h"
#import "Macros.h"
#import "UILabel+Extension.h"
#import "UIView+Extension.h"

@interface KRArrowIconRowView()

@property (nonatomic, assign) BOOL hiddenArrow;// default is NO

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *arrowImgView;

@end

@implementation KRArrowIconRowView

+ (instancetype)rowViewWithTitle:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden {
    KRArrowIconRowView *rowView = [[KRArrowIconRowView alloc] initWithTitle:title subtitle:subTitle iconName:imgName hiddenArrow:isHidden];
    return rowView;
}

+ (instancetype)rowViewWithSize:(CGSize)size title:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden {
    KRArrowIconRowView *rowView = [[KRArrowIconRowView alloc] initWithTitle:title subtitle:subTitle iconName:imgName hiddenArrow:isHidden];
    rowView.frame = CGRectMake(0, 0, size.width, size.height);
    return rowView;
}

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subTitle iconName:(NSString *)imgName hiddenArrow:(BOOL)isHidden {
    if (self = [super init]) {
        self.title = title;
        self.subTitle = subTitle;
        self.iconImgName = imgName;
        self.hiddenArrow = isHidden;
        [self prepareUI];
    }
    return self;
}

- (void)rowDidClick:(UITapGestureRecognizer *)tapGesture {
    if (self.rowDidClickBlock) {
        self.rowDidClickBlock();
    }
}

- (void)prepareUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(self).offset(12);
        make.trailing.equalTo(self).offset(-12);
    }];
    
    if (self.iconImgName) {
        self.iconImgView.image = [UIImage imageNamed:_iconImgName];
        [_contentView addSubview:self.iconImgView];
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.centerY.equalTo(_contentView);
        }];
    }
    
    if (self.title.length) {
        self.titleLable.text = _title;
        [_contentView addSubview:self.titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_contentView).offset(self.iconImgName.length ? _iconImgView.image.size.width + 12 : 0);
            make.centerY.equalTo(_contentView);
        }];
    }
    
    if (!self.hiddenArrow) {
        [_contentView addSubview:self.arrowImgView];
        [_arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.centerY.equalTo(_contentView);
        }];
    }
    
    if (self.subTitle.length) {
        self.subtitleLabel.text = _subTitle;
        [_contentView addSubview:self.subtitleLabel];
        [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(_contentView).offset(self.hiddenArrow ? 0 : -28);
            make.centerY.equalTo(_contentView);
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
    [self.contentView addSubview:subIconView];
    [subIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_contentView).offset(self.hiddenArrow ? 0 : -28);
        make.centerY.equalTo(_contentView);
        make.size.mas_equalTo(CGSizeMake(subIconView.width, subIconView.height));
    }];
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rowDidClick:)];
        [_contentView addGestureRecognizer:tap];
    }
    return _contentView;
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
