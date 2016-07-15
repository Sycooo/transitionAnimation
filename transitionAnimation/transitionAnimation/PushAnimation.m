//
//  PushAnimation.m
//  transitionAnimation
//
//  Created by yiming li on 16/7/15.
//  Copyright © 2016年 puxbao. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext

{
    
    return 0.9;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //目的ViewController
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //起始ViewController
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    //添加toView到上下文
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
           
            fromViewController.view.alpha = 0;
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.01 animations:^{
           
            toViewController.view.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.22 relativeDuration:0.65 animations:^{
            
            toViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
            
        }];
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}

@end
