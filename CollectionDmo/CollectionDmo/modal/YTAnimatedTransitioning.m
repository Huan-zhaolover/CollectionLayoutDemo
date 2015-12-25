//
//  YTAnimatedTransitioning.m
//  测试代码
//
//  Created by lanou3g on 15/12/1.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import "YTAnimatedTransitioning.h"
#import "UIView+Frame.h"
@implementation YTAnimatedTransitioning


#pragma mark 实现  UIViewControllerAnimatedTransitioning

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}
//动画过度.
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
/*
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    if (self.presented) {
         UIView *toView= [transitionContext  viewForKey:UITransitionContextToViewKey];
    //  UITransitionContextFromViewKey   UITransitionContextToViewKey
    
    CGFloat y= - toView.frame.size.height;
    CGRect  rect1=toView.frame;
    rect1.origin.y=y;
    toView.frame=rect1;
    
    [UIView animateWithDuration:5.0 animations:^{
        // 利用传得参数,获取到要处理的view.
        CGRect  rect1=toView.frame;
        rect1.origin.y=0;
        toView.frame=rect1;
    }completion:^(BOOL finished) {
        // 结束的时候完成动画
        [transitionContext completeTransition:YES];
        
    } ];
        
    }else{
       //  UITransitionContextFromViewKey   UITransitionContextToViewKey
        UIView *toView= [transitionContext  viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:5.0 animations:^{
            // 利用传得参数,获取到要处理的view.
            CGFloat y= - toView.frame.size.height;
            CGRect  rect1=toView.frame;
            rect1.origin.y=y;
            toView.frame=rect1;
        }completion:^(BOOL finished) {
            // 结束的时候完成动画
            [transitionContext completeTransition:YES];
            
        } ];

    }
    
}
*/

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.presented) {
        //  UITransitionContextFromViewKey   UITransitionContextToViewKey
        UIView *toView= [transitionContext  viewForKey:UITransitionContextToViewKey];
        toView.layer.transform=CATransform3DMakeRotation(M_PI_2, -1, -1, 1);
        
        
        [UIView animateWithDuration:1.0 animations:^{
            // 利用传得参数,获取到要处理的view.
            toView.layer.transform=CATransform3DIdentity;//清空3D效果.

        }completion:^(BOOL finished) {
            // 结束的时候完成动画
            [transitionContext completeTransition:YES];
            
        } ];
        
    }else{
        /*    
         //  UITransitionContextFromViewKey   UITransitionContextToViewKey
        UIView *toView= [transitionContext  viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:1.0 animations:^{
            
        toView.layer.transform=CATransform3DMakeRotation(M_PI_2, -1, -1, 1);

        }completion:^(BOOL finished) {
            // 结束的时候完成动画
            [transitionContext completeTransition:YES];
            
        } ];
        */
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
