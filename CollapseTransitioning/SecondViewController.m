//
//  SecondViewController.m
//  CollapseTransitioning
//
//  Created by S.C. on 16/9/7.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIImageView *image = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image.image        = [UIImage imageNamed:@"Image"];
    [self.view addSubview:image];
    
    UITapGestureRecognizer *tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.view addGestureRecognizer:tapToClose];
}

- (void)close {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
