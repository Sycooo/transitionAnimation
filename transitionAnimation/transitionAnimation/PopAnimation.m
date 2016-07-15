//
//  PopAnimation.m
//  transitionAnimation
//
//  Created by yiming li on 16/7/15.
//  Copyright © 2016年 puxbao. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] insertSubview:toVC.view belowSubview:fromVC.view];
    
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            
            toVC.view.alpha = 1.0;
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.4 animations:^{
           
            fromVC.view.layer.transform = CATransform3DMakeScale(0, 0, 0);
            
        }];
        
        
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}

@end
