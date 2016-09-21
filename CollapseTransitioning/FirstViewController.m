//
//  FirstViewController.m
//  CollapseTransitioning
//
//  Created by S.C. on 16/9/7.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SACCollapseAnimator.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIButton *go              = [UIButton buttonWithType:UIButtonTypeSystem];
    go.bounds                 = CGRectMake(0, 0, 100, 50);
    go.center                 = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    self.view.backgroundColor = [UIColor colorWithRed:1 green:171 / 255.0 blue:167 / 255.0 alpha:1];
    
    [go setTitle:@"Go" forState:UIControlStateNormal];
    [go addTarget:self action:@selector(transition) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:go];
}

- (void)transition {
    
    SecondViewController *secView = [[SecondViewController alloc] init];
    secView.transitioningDelegate = self;
    [self presentViewController:secView animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    SACCollapseAnimator *animator = [[SACCollapseAnimator alloc] init];
    //animator.duration = 1;
    //animator.sideLength = 8;
    return animator;
}

@end
