//
//  YZ_Place_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Place_TableViewCell.h"
#import "YZ_Place_CollectionViewCell.h"
@interface YZ_Place_TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UICollectionView *myCollectionview;

@property (nonatomic, strong) UIImageView *imagepo;
@property (nonatomic, strong) UIImageView *imagepop;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *slodLabel;

@property (nonatomic, strong) UILabel *titLabel;
@property (nonatomic, strong) UILabel *priLabel;
@property (nonatomic, strong) UILabel *sloLabel;

@end

@implementation YZ_Place_TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubView];
    }
    
    return self;
}


-(void)createSubView{
    
    self.countryLabel = [UILabel new];
    _countryLabel.backgroundColor = [UIColor yellowColor];
    _countryLabel.text = @"欧洲美国";
    [self.contentView addSubview:_countryLabel];
    
    self.imagepo = [UIImageView new];
    self.imagepo.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_imagepo];
    
    self.imagepop = [UIImageView new];
    self.imagepop.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_imagepop];

    self.titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.numberOfLines = 0;
    
    self.priceLabel = [UILabel new];
    _priceLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_priceLabel];
    self.priceLabel.textColor = [UIColor redColor];
    
    self.slodLabel = [UILabel new];
    _slodLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_slodLabel];
//    
    self.titLabel = [UILabel new];
    _titLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_titLabel];
    
    self.priLabel = [UILabel new];
    _priLabel.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_priLabel];
    
    self.sloLabel = [UILabel new];
    _sloLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_sloLabel];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(85 , 80);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 5, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.myCollectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.myCollectionview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.myCollectionview];
    
    _myCollectionview.delegate = self;
    _myCollectionview.dataSource = self;
    
    
    
    //    注册
    
    [self.myCollectionview registerClass:[YZ_Place_CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

//重新布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    _countryLabel.frame = CGRectMake(self.bounds.size.width / 2 - 25 , 10 , 100, 30);
    
    self.myCollectionview.frame = CGRectMake(0, _countryLabel.frame.origin.y + _countryLabel.frame.size.height + 8, self.bounds.size.width, 100);
    
    self.imagepo.frame = CGRectMake(_myCollectionview.frame.origin.x + 10, _myCollectionview.frame.size.height + 50, 85, 100);
    
    self.imagepop.frame = CGRectMake(_imagepo.frame.origin.x, _imagepo.frame.origin.y + _imagepo.frame.size.height + 10, _imagepo.frame.size.width, 100);
    
    self.titleLabel.frame = CGRectMake(_imagepo.frame.origin.x + _imagepo.frame.size.width + 5 , _imagepo.frame.origin.y + 8,280, 45);
 
    self.slodLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 23, 100, 20);
    
    self.priceLabel.frame = CGRectMake(_slodLabel.frame.origin.x + _slodLabel.frame.size.width + 130, _slodLabel.frame.origin.y - 8, 70, 30);
    
//
    self.titLabel.frame = CGRectMake(_imagepop.frame.origin.x + _imagepop.frame.size.width + 5 , _imagepop.frame.origin.y + 8,280, 45);
     self.sloLabel.frame = CGRectMake(_titLabel.frame.origin.x, _titLabel.frame.origin.y + _titLabel.frame.size.height + 16, 100, 20);

    self.priLabel.frame = CGRectMake(_sloLabel.frame.origin.x + _sloLabel.frame.size.width + 130, _sloLabel.frame.origin.y - 6, 70, 30);
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _placeArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_Place_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.listMocel = [_placeArray objectAtIndex:indexPath.item];
    
    cell.backgroundColor = [UIColor magentaColor];
    
    return cell;
}


-(void)setAreaMocel:(YZ_Hot_area_Model *)areaMocel{
    
    _areaMocel = areaMocel;
    
    self.placeArray = [NSMutableArray arrayWithArray:_areaMocel.place];
  
    self.array = [NSMutableArray arrayWithArray:_areaMocel.list];
    
    YZ_HotList_Model *pomodel = _array[0];
    YZ_HotList_Model *popmodel = _array[1];
    
    NSURL *url = [NSURL URLWithString:pomodel.photo];
    [self.imagepo sd_setImageWithURL:url];
    
    NSURL *url2 = [NSURL URLWithString:popmodel.photo];
    [self.imagepop sd_setImageWithURL:url2];
    
    self.titleLabel.text = pomodel.title;
    self.slodLabel.text = pomodel.sold;
    self.priceLabel.text = pomodel.price;
    
   
    self.titLabel.text = popmodel.title;
    self.sloLabel.text = popmodel.sold;
    self.priLabel.text = popmodel.price;
    
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
