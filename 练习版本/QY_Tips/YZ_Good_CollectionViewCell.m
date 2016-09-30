
//
//  YZ_Good_CollectionViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Good_CollectionViewCell.h"
#import "YZ_Good_CollcetCell.h"
@interface YZ_Good_CollectionViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *goodLabel;//区标题
@property (nonatomic, strong) UICollectionView *myCollectionview;
@end

@implementation YZ_Good_CollectionViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self crateSubView];
    }
    
    return self;
}


-(void)crateSubView{
    
    self.goodLabel = [UILabel new];
    _goodLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_goodLabel];
    _goodLabel.text = @"有好货";
    _goodLabel.font = [UIFont systemFontOfSize:23];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(190 , 180);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 5, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.myCollectionview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.myCollectionview];
    
    _myCollectionview.delegate = self;
    _myCollectionview.dataSource = self;
    
    //    注册
    [self.myCollectionview registerClass:[YZ_Good_CollcetCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _goodArr.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_Good_CollcetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.goodMocel = _goodArr[indexPath.row];
    
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.goodLabel.frame = CGRectMake(self.contentView.bounds.size.width / 2 - 35, 10, 80, 30);
    
    self.myCollectionview.frame = CGRectMake(0, _goodLabel.frame.origin.y + _goodLabel.frame.size.height + 5, self.bounds.size.width, self.bounds.size.height);
    
}


-(void)setGoodArr:(NSMutableArray *)goodArr{
    _goodArr = goodArr;

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
