//
//  YTCircleLayout.m
//  测试代码
//
//  Created by Yutao on 15/12/3.
//  Copyright © 2015年 yutao. All rights reserved.
//

#import "YTCircleLayout.h"

@implementation YTCircleLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(self.circleRadius*0.618, self.circleRadius*0.618);
    
    // 圆的半径
    CGFloat circleRadius =self.circleRadius;
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    // 每个item之间的角度
    CGFloat angleDelta = M_PI * 2 / [self.collectionView numberOfItemsInSection:indexPath.section];
    
    // 计算当前item的角度
    CGFloat angle = indexPath.item * angleDelta;
    
    attrs.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
    
    attrs.zIndex = indexPath.item;
    
    return attrs;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}

@end
