//
//  YTTransition.m
//  Gourment
//
//  Created by Yutao on 15/12/12.
//  Copyright © 2015年 DGY. All rights reserved.
//

#import "YTTransition.h"
#import "PresentationController.h"
#import "YTAnimation.h"
@implementation YTTransition
+(YTTransition*)defauleTransition{
    static  YTTransition *transtation=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        transtation=[[YTTransition alloc]init];
        
    });
    return transtation;
}
#pragma mark  实现 展示/动画自定义 告诉控制器,谁负责展示,谁负责展示动画,三个代理方法..仅仅告诉谁处理.然后再处理怎么做.

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[PresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    YTAnimation *anim=[[YTAnimation alloc]init];
    anim.presented=YES;
    
    return anim;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    YTAnimation *anim=[[YTAnimation alloc]init];
    anim.presented=NO;
    return anim;
}

@end
