//
//  YZ_City_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/30.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_City_TableViewCell.h"
#import "YZ_City_CollectionViewCell.h"
@interface YZ_City_TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *myCollectionview;

@end

@implementation YZ_City_TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubView];
    }
    
    return self;
}


-(void)createSubView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(85 , 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.myCollectionview.backgroundColor = [UIColor whiteColor];
    self.myCollectionview.scrollEnabled = NO;
    [self.contentView addSubview:self.myCollectionview];
    
    _myCollectionview.delegate = self;
    _myCollectionview.dataSource = self;
    
    
    //    注册
    [self.myCollectionview registerClass:[YZ_City_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.myCollectionview.frame = self.contentView.bounds;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _cityArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_City_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.cityModel = _cityArray[indexPath.row];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


-(void)setCityArray:(NSMutableArray *)cityArray{
    
    _cityArray = cityArray;

    [self.myCollectionview reloadData];
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
