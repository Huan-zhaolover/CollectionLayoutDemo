//
//  PresentationController.m
//  测试代码
//
//  Created by lanou3g on 15/12/1.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import "PresentationController.h"

@implementation PresentationController

// (Default: container view bounds)
- (CGRect)frameOfPresentedViewInContainerView{

    
    
    //self.contenview 是容纳将要推出的视图的大小.默认是手机屏幕大小.
//    return CGRectMake(0, 50, self.containerView.frame.size.width, self.containerView.frame.size.height);
    
  //  return CGRectMake(100, 100, 200, 200);
   // CGrRectInset 是值按第一个参数,x方向左右各减去10 .上下方向各减去50;
    return CGRectInset(self.containerView.bounds, 10, 50);
    
}
- (void)presentationTransitionWillBegin{
    
    //若是动画自定义 则需要自己添加视图,上面那个控制大小位置的已经不能用了;
    self.presentedView.frame=self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    
       NSLog(@"presentationTransitionWillBegin");
}
- (void)presentationTransitionDidEnd:(BOOL)completed{
       NSLog(@"presentationTransitionDidEnd");
}
- (void)dismissalTransitionWillBegin{
   NSLog(@"dismissalTransitionWillBegin");
}
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    //  取消了值后,移除视图.
    [self.presentedView removeFromSuperview];
       NSLog(@"dismissalTransitionDidEnd");
}


@end
