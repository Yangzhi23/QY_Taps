
//
//  YZ_ hot_country_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_ hot_country_TableViewCell.h"
#import "YZ_ hot_country_CollectionCell.h"
@interface YZ__hot_country_TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic, strong) UICollectionView *myCollectionview;

@end

@implementation YZ__hot_country_TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubView];
    }
    
    return self;
}


-(void)createSubView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(190 , 220);
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0 , 414 ,8 * 185) collectionViewLayout:flowLayout];
    self.myCollectionview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.myCollectionview];
    
    _myCollectionview.delegate = self;
    _myCollectionview.dataSource = self;
    
    
    
    //    注册
    
    [self.myCollectionview registerClass:[YZ__hot_country_CollectionCell class] forCellWithReuseIdentifier:@"cell"];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ__hot_country_CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.country = _dataArray[indexPath.row];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


-(void)setHot_countryModel:(YZ__Continent_Model *)hot_countryModel{
    
    _hot_countryModel = hot_countryModel;
    
    _dataArray = [NSMutableArray arrayWithArray:hot_countryModel.hot_country];
    
    [self.myCollectionview reloadData];
}


//collectionview的点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    
    [self.myDelegate doSomething];
    
    
    
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
