//
//  PresentationController.h
//  测试代码
//
//  Created by lanou3g on 15/12/1.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentationController : UIPresentationController


// (Default: container view bounds)
- (CGRect)frameOfPresentedViewInContainerView;

// By default each new presentation is full screen.
// This behavior can be overriden with the following method to force a current context presentation.
// (Default: YES)
- (BOOL)shouldPresentInFullscreen;

// Indicate whether the view controller's view we are transitioning from will be removed from the window in the end of the
// presentation transition
// (Default: NO)
- (BOOL)shouldRemovePresentersView;
- (void)presentationTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)completed;
- (void)dismissalTransitionWillBegin;
- (void)dismissalTransitionDidEnd:(BOOL)completed;

@end
