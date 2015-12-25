//
//  YTWaterflowLayout.h
//  测试代码
//
//  Created by Yutao on 15/12/3.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YTWaterflowLayout;

@protocol YTWaterflowLayoutDelegate <NSObject>
- (CGFloat)waterflowLayout:(YTWaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end


@interface YTWaterflowLayout : UICollectionViewLayout


@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<YTWaterflowLayoutDelegate> delegate;



@end
