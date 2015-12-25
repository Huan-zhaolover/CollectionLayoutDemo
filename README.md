# CollectionLayoutDemo
多种Layout的展示,使用只要2行代码,自定义模态控制器切换动画
 四种Layout的界面展示,如下引入头文件即可
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
