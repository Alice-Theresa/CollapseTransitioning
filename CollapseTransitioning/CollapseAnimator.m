//
//  CollapseAnimator.m
//  CollapseTransitioning
//
//  Created by S.C. on 16/9/7.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "CollapseAnimator.h"

@implementation CollapseAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //默认转场时间为2s
    _duration = _duration ? : 2;
    return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //默认边长为10
    _sideLength = _sideLength ? : 10;
    
    //获取View
    UIView *containerView = [transitionContext containerView];
    UIView *fromView      = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView        = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    //截图
    UIView *fromViewSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    
    //获取横、纵两轴的抽样点 抽样间隔为10
    NSMutableArray *xSampleArray = [[NSMutableArray alloc] init];
    NSMutableArray *ySampleArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < fromView.bounds.size.width; i = i + _sideLength) {
        [xSampleArray addObject:@(i)];
    }
    for (NSInteger i = 0; i < fromView.bounds.size.height; i = i + _sideLength) {
        [ySampleArray addObject:@(i)];
    }
    
    //根据抽样点切割
    NSMutableArray *snapshots = [[NSMutableArray alloc] init];
    
    for (NSNumber *x in xSampleArray) {
        for (NSNumber *y in ySampleArray) {
            CGRect snapshotRegion = CGRectMake([x doubleValue], [y doubleValue], _sideLength, _sideLength);
            UIView *snapshot      = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            snapshot.frame        = snapshotRegion;
            [containerView addSubview:snapshot];
            [snapshots addObject:snapshot];
        }
    }
    
    //打印切割后的总数
    //NSLog(@"%ld", snapshots.count);
    
    //布置View
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    [containerView sendSubviewToBack:fromView];
    
    //Collapse动画
    [UIView animateWithDuration:_duration
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         for (UIView *view in snapshots) {
                             view.frame = CGRectOffset(view.frame, [self randomRange:200 offset:-100], [self randomRange:200 offset:fromView.frame.size.height]);
                         }
                     }
                     completion:^(BOOL finished) {
                         for (UIView *view in snapshots) {
                             [view removeFromSuperview];
                         }
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

- (CGFloat)randomRange:(NSInteger)range offset:(NSInteger)offset {
    
    return (CGFloat)(arc4random()%range + offset);
}

@end
