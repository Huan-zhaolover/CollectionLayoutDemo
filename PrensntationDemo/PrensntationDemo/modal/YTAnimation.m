//
//  YTAnimation.m
//  Gourment
//
//  Created by Yutao on 15/12/12.
//  Copyright © 2015年 DGY. All rights reserved.
//

#import "YTAnimation.h"
#import "UIView+Frame.h"
@implementation YTAnimation
#pragma mark 实现  UIViewControllerAnimatedTransitioning

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

//动画过度.
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    if (self.presented) {
        UIView *toView= [transitionContext  viewForKey:UITransitionContextToViewKey];
        //  UITransitionContextFromViewKey   UITransitionContextToViewKey
        toView.x=-toView.width;
        toView.y=-toView.height;
        
        [UIView animateWithDuration:1.0 animations:^{
             // 利用传得参数,获取到要处理的view.
            toView.x=0;
            toView.y=0;
            
        }completion:^(BOOL finished) {
            // 结束的时候完成动画
            [transitionContext completeTransition:YES];
            
        } ];
        
    }else{
        //  UITransitionContextFromViewKey   UITransitionContextToViewKey
        
        UIView *toView= [transitionContext  viewForKey:UITransitionContextFromViewKey];// 自己相当于toview;
        
        [UIView animateWithDuration:1.0 animations:^{
            // 利用传得参数,获取到要处理的view.
            toView.x=toView.width;
            toView.y=-toView.height;
        
            
        }completion:^(BOOL finished) {
            // 结束的时候完成动画
            [transitionContext completeTransition:YES];
            
        } ];
        
    }
    
}





@end
