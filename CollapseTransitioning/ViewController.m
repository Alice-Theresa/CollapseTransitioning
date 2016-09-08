//
//  ViewController.m
//  CollapseTransitioning
//
//  Created by S.C. on 16/9/7.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CollapseAnimator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [_go addTarget:self action:@selector(transition) forControlEvents:UIControlEventTouchDown];
}

- (void)transition {
    
    SecondViewController *secView = [[SecondViewController alloc] init];
    secView.transitioningDelegate = self;
    [self presentViewController:secView animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    CollapseAnimator *animator = [[CollapseAnimator alloc] init];
    //animator.duration = 1;
    //animator.sideLength = 8;
    return animator;
}

@end
