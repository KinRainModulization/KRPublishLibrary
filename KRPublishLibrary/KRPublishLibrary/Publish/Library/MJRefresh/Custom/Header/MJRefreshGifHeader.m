//
//  MJRefreshGifHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshGifHeader.h"

const static CGFloat GIFRefreshHeaderHeight = 115;

@interface MJRefreshGifHeader()

@property (nonatomic, weak) UIImageView *gifView;
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;

@property (nonatomic, strong) UIView *containerView;
@end


@implementation MJRefreshGifHeader
#pragma mark - 懒加载

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, GIFRefreshHeaderHeight)];
    }
    return _containerView;
}

- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.containerView addSubview:_gifView = imageView];
    }
    return _gifView;
}

- (NSMutableDictionary *)stateImages
{
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}

- (NSMutableDictionary *)stateDurations
{
    if (!_stateDurations) {
        self.stateDurations = [NSMutableDictionary dictionary];
    }
    return _stateDurations;
}

#pragma mark - 公共方法
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state
{
    if (images == nil) return;
    
    self.stateImages[@(state)] = images;
    self.stateDurations[@(state)] = @(duration);
    
    /* 根据图片设置控件的高度 */
//    UIImage *image = [images firstObject];
//    if (image.size.height > self.mj_h) {
//        self.mj_h = image.size.height;
//    }
}

- (void)setImages:(NSArray *)images forState:(MJRefreshState)state
{
    [self setImages:images duration:images.count * 0.1 forState:state];
}

#pragma mark - 实现父类的方法
- (void)prepare
{
    [super prepare];
    
    self.mj_h = GIFRefreshHeaderHeight;
    
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    NSArray *images = self.stateImages[@(MJRefreshStateIdle)];
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifView stopAnimating];
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifView.image = images[index];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    UIView *backgroundView = [[UIView alloc] init];
    [backgroundView addSubview:self.containerView];
    self.tableView.backgroundView = backgroundView;
    
    if (self.gifView.constraints.count) return;
    
    self.gifView.frame = CGRectMake(0, 20, self.containerView.mj_w, 75);
    self.gifView.contentMode = UIViewContentModeCenter;
//    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
//        self.gifView.contentMode = UIViewContentModeCenter;
//    } else {
//        self.gifView.contentMode = UIViewContentModeRight;
//        
//        CGFloat stateWidth = self.stateLabel.mj_textWith;
//        CGFloat timeWidth = 0.0;
//        if (!self.lastUpdatedTimeLabel.hidden) {
//            timeWidth = self.lastUpdatedTimeLabel.mj_textWith;
//        }
//        CGFloat textWidth = MAX(stateWidth, timeWidth);
//        self.gifView.mj_w = self.mj_w * 0.5 - textWidth * 0.5 - self.labelLeftInset;
//    }
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        NSArray *images = self.stateImages[@(state)];
        if (images.count == 0) return;
        
        [self.gifView stopAnimating];
        if (images.count == 1) { // 单张图片
            self.gifView.image = [images lastObject];
        } else { // 多张图片
            self.gifView.animationImages = images;
            self.gifView.animationDuration = [self.stateDurations[@(state)] doubleValue];
            [self.gifView startAnimating];
        }
    } else if (state == MJRefreshStateIdle) {
        [self.gifView stopAnimating];
    }
}
@end
