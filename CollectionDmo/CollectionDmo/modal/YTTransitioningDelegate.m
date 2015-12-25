//
//  YTTransitioningDelegate.m
//  测试代码
//
//  Created by lanou3g on 15/12/1.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import "YTTransitioningDelegate.h"
#import "PresentationController.h"
#import "YTAnimatedTransitioning.h"

@implementation YTTransitioningDelegate

+(instancetype)shareTanstation{
    static  YTTransitioningDelegate *transtation=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        transtation=[[YTTransitioningDelegate alloc]init];
        
    });
    return transtation;
}

#pragma mark 使用storyboard 使用以下方法,在推出之前,在点击事件里调用添加代理.拖线要完善.

// 也可以使用以下方法,在storuboard 中 不使用拖线方式,直接在代码中present出现.代码补充.
#if 0
-(void)clickButton{

    UIViewController *controller= [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"controller"];
    controller.modalPresentationStyle=UIModalPresentationCustom;
    controller.transitioningDelegate=[YTTransitioningDelegate shareTanstation];
    [self presentViewController:controller animated:YES completion:nil]
}

#endif
// 也可以使用以下方法,在storuboard 中,拖presentmodal线跳转,在将要的出现的控制器的init方法中,写下面的.
#if 0
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        
        self.modalPresentationStyle=UIModalPresentationCustom;
        self.transitioningDelegate=[YTTransitioningDelegate shareTanstation];
    } 
    return self;
}


#endif



#pragma mark  实现 展示/动画自定义 告诉控制器,谁负责展示,谁负责展示动画,三个代理方法..仅仅告诉谁处理.然后再处理怎么做.

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[PresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    YTAnimatedTransitioning *anim=[[YTAnimatedTransitioning alloc]init];
    anim.presented=YES;
    
    return anim;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    YTAnimatedTransitioning *anim=[[YTAnimatedTransitioning alloc]init];
    anim.presented=NO;
    return anim;
}


@end
