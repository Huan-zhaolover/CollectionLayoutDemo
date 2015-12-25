//
//  YTTransition.h
//  Gourment
//
//  Created by Yutao on 15/12/12.
//  Copyright © 2015年 DGY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 负责 位移的变化.
@interface YTTransition : NSObject <UIViewControllerTransitioningDelegate>

+(YTTransition*)defauleTransition;
@end
