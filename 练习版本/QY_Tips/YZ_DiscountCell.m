//
//  YZ_DiscountCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_DiscountCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_DiscountCell ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *slodLabel;

@end

@implementation YZ_DiscountCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self creatrSubView];
    }
    
    return self;
}


-(void)creatrSubView{
    
    self.imageV = [UIImageView new];
    self.imageV.backgroundColor = [UIColor brownColor];
    [self.contentView addSubview:_imageV];
    
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
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _imageV.frame = CGRectMake(10, 12, 85, 100);
    _titleLabel.frame = CGRectMake(_imageV.frame.origin.x + _imageV.frame.size.width + 5, _imageV.frame.origin.y + 3, 280, 50);
    _slodLabel.frame = CGRectMake(_titleLabel.frame.origin.x , _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 25, 80, 20);
    _priceLabel.frame = CGRectMake(_slodLabel.frame.origin.x + _slodLabel.frame.size.width + 170, _slodLabel.frame.origin.y - 10, 50, 30);
    
}


-(void)setListMocel:(YZ_HotList_Model *)listMocel{
    
    _listMocel = listMocel;
    
    NSURL *url = [NSURL URLWithString:listMocel.photo];
    [self.imageV sd_setImageWithURL:url];
    
    _titleLabel.text = listMocel.title;
    _slodLabel.text = listMocel.sold;
    _priceLabel.text = listMocel.price;
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
