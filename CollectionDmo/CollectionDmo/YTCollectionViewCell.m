//
//  YTCollectionViewCell.m
//  CollectionDmo
//
//  Created by Yutao on 15/12/24.
//  Copyright © 2015年 YTYT. All rights reserved.
//

#import "YTCollectionViewCell.h"

@implementation YTCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.celliamgeView.layer.borderWidth = 3;
    self.celliamgeView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.celliamgeView.layer.cornerRadius = 3;
    self.celliamgeView.clipsToBounds = YES;
}

-(void)setImage:(NSString *)image{

    _image=[image copy];
    self.celliamgeView.image=[UIImage imageNamed:image];
}

@end
