//
//  CollectionController.m
//  CollectionDmo
//
//  Created by Yutao on 15/12/24.
//  Copyright © 2015年 YTYT. All rights reserved.
//

#import "CollectionController.h"
#import "YTCollectionViewCell.h"
#import "YTTransitioningDelegate.h"


#import "YTCircleLayout.h"
#import "YTLineLayout.h"
#import "YTWaterflowLayout.h"
#import "YTStackLayout.h"

@interface CollectionController ()<UICollectionViewDataSource,UICollectionViewDelegate,YTWaterflowLayoutDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *datasourse;
@property (nonatomic,strong)YTWaterflowLayout *waterlayout;
@property (nonatomic,strong)YTCircleLayout *circlelayout;
@property (nonatomic,strong)YTStackLayout *stacklayout;

@end

@implementation CollectionController

static NSString *cell=@"imageview";

-(NSMutableArray *)datasourse{

    if (!_datasourse) {
        _datasourse=[NSMutableArray array];
    }
    return _datasourse;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self==[super initWithCoder:aDecoder]) {
        self.modalPresentationStyle=UIModalPresentationCustom;
        self.transitioningDelegate=[YTTransitioningDelegate shareTanstation];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    switch (self.flag) {
        case 1:
            _waterlayout=[[YTWaterflowLayout alloc]init];
            _collectionView.collectionViewLayout=_waterlayout;
              _waterlayout.delegate=self;
            _waterlayout.columnsCount=2;
            break;
        case 2:
           _circlelayout=[[YTCircleLayout alloc]init];
            _collectionView.collectionViewLayout=_circlelayout;
            _circlelayout.circleRadius=150;
            break;
        case 3:
            _collectionView.collectionViewLayout=[[YTLineLayout alloc]init];
            break;
        case 4:
            _stacklayout=[[YTStackLayout alloc]init];
            _collectionView.collectionViewLayout=_stacklayout;
            _stacklayout.itemSize=CGSizeMake(300, 300);
            break;
        default:
            break;
    }
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"YTCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cell];
    
    for (int i = 1; i<14; i++) {
        NSString *imagepath=[NSString stringWithFormat:@"%d.jpg",i];
        [self.datasourse addObject:imagepath];
    }
    
    
     // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%ld",self.datasourse.count);

    return self.datasourse.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     YTCollectionViewCell *collectioncell=[collectionView dequeueReusableCellWithReuseIdentifier:cell forIndexPath:indexPath];
     collectioncell.image=self.datasourse[indexPath.item];
    return collectioncell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self.datasourse removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}


-(CGFloat)waterflowLayout:(YTWaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{

    return arc4random()%100+150;
}

- (IBAction)didClickBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
