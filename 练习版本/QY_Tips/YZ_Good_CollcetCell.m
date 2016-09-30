//
//  YZ_Good_CollcetCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Good_CollcetCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_Good_CollcetCell ()

@property (nonatomic ,strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *slodLabel;
@property (nonatomic, strong) UILabel *priceLabel;


@end

@implementation YZ_Good_CollcetCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubView];
    }
    return self;
}


-(void)createSubView{
    
    self.imageV = [UIImageView new];
    _imageV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imageV];
    
    self.titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_titleLabel];
    
    self.slodLabel = [UILabel new];
    _slodLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_slodLabel];
    
    
    self.priceLabel = [UILabel new];
    _priceLabel.backgroundColor = [UIColor cyanColor];
    _priceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:_priceLabel];
}

-(void)layoutSubviews{
    
    _imageV.frame = CGRectMake(0, 0, self.bounds.size.width, 90);
    
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _imageV.frame.origin.y + _imageV.frame.size.height + 5, _imageV.frame.size.width, 40);
    _slodLabel.frame = CGRectMake(_titleLabel.frame.origin.x + 10, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 15, 80, 20);
    
    _priceLabel.frame = CGRectMake(_slodLabel.frame.origin.x + _slodLabel.frame.size.width + 20, _slodLabel.frame.origin.y - 5, 80 ,30 );
    
    
}

-(void)setGoodMocel:(YZ_HotList_Model *)goodMocel{
    
    _goodMocel = goodMocel;
    
    NSURL *url = [NSURL URLWithString:goodMocel.photo];
    [self.imageV sd_setImageWithURL:url];
    
    self.titleLabel.text = goodMocel.title;
    self.slodLabel.text = goodMocel.status;
    self.priceLabel.text = goodMocel.price;
    
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
