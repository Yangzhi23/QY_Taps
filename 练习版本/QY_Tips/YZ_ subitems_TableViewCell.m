//
//  YZ_ subitems_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#import <UIImageView+WebCache.h>
#import "YZ_ subitems_TableViewCell.h"
#import "YZ_Subitem_CollectionViewCell.h"

@interface YZ__subitems_TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *columLabel;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UIImageView *poImageV;
@property (nonatomic, strong) UILabel *lineLabel;//线

@property (nonatomic, strong) UICollectionView *myCollectionview;


@end

@implementation YZ__subitems_TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.columLabel = [UILabel new];
        _columLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_columLabel];
        
        self.titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.subjectLabel = [UILabel new];
        _subjectLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.subjectLabel];
        _subjectLabel.numberOfLines = 0;
        
        self.poImageV = [UIImageView new];
        _poImageV.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:_poImageV];
        
        self.lineLabel = [UILabel new];
        _lineLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_lineLabel];
        
        
        
        [self createSubView];
    }
    return self;
}



-(void)createSubView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(160 , 180);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    /*设置头部视图的大小*/
//    flowLayout.headerReferenceSize = CGSizeMake(0, 200);
//    flowLayout.footerReferenceSize = CGSizeMake(0, 100);
    
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(_subjectLabel.frame.origin.x - 10, _subjectLabel.frame.size.height + _subjectLabel.frame.origin.y + 40, WIDTH, 200) collectionViewLayout:flowLayout];
    [self.contentView addSubview:self.myCollectionview];
//    _myCollectionview.backgroundColor = [UIColor whiteColor];
    
    _myCollectionview.delegate = self;
    _myCollectionview.dataSource = self;

    
    
//    注册
    
    [self.myCollectionview registerClass:[YZ_Subitem_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
}

//重新布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    _columLabel.frame = CGRectMake(0, 10, 72, 20);
    
    _titleLabel.frame = CGRectMake(80, 80, WIDTH - 160, 55);
    _subjectLabel.frame = CGRectMake(_titleLabel.frame.origin.x - 50, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 23, WIDTH - (_titleLabel.frame.origin.x - 50) * 2, 60);
    _myCollectionview.frame = CGRectMake(_subjectLabel.frame.origin.x - 10, _subjectLabel.frame.size.height + _subjectLabel.frame.origin.y + 40, WIDTH, 200);
 
    _poImageV.frame = CGRectMake(WIDTH / 2 - 20, _myCollectionview.frame.origin.y + _myCollectionview.frame.size.height + 20, 60, 60);

    _lineLabel.frame =CGRectMake(0, _poImageV.frame.origin.y + _poImageV.frame.size.height + 30, WIDTH, 15);
    
}




//返回的是Item的个数,以及collectionviewCell的内容
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_Subitem_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.ritemModel = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}



//重写set方法
-(void)setRecommendModel:(YZ_Recommend_Model *)recommendModel{
    _recommendModel = recommendModel;
    
    _titleLabel.text = recommendModel.title;
    _columLabel.text = recommendModel.column;
    _subjectLabel.text = recommendModel.subject;
    NSURL *url = [NSURL URLWithString:recommendModel.icon_url];
    [self.poImageV sd_setImageWithURL:url];
    
    _dataArray = [NSMutableArray arrayWithArray:recommendModel.subitems];
    
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
