//
//  CollapseAnimator.h
//  CollapseTransitioning
//
//  Created by S.C. on 16/9/7.
//  Copyright © 2016年 Kabylake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CollapseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  转场时间
 */
@property (nonatomic, assign) NSTimeInterval duration;

@end
