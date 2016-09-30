//
//  YZ__hot_city_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/30.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ__hot_city_TableViewCell.h"

@interface YZ__hot_city_TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *myCollectionview;

@end

@implementation YZ__hot_city_TableViewCell


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
    [self.myCollectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.myCollectionview.frame = self.contentView.bounds;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
