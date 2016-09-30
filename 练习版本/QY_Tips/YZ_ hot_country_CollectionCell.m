
//
//  YZ_ hot_country_CollectionCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//
#import "YZ_ hot_country_CollectionCell.h"
#import <UIImageView+WebCache.h>
@interface YZ__hot_country_CollectionCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *cnnameLabel;
@end

@implementation YZ__hot_country_CollectionCell


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
    _imageV.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_imageV];
    
    self.cnnameLabel = [UILabel new];
    _cnnameLabel.backgroundColor = [UIColor yellowColor];
    [_imageV addSubview:_cnnameLabel];
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    self.imageV.frame = self.contentView.bounds;
    
    self.cnnameLabel.frame = CGRectMake(5, _imageV.frame.size.height - 50, 50, 50);
    
}


-(void)setCountry:(YZ__Country_Model *)country{
    
    _country = country;
    
    self.cnnameLabel.text = country.cnname;
    
    NSURL *url = [NSURL URLWithString:country.photo];
    
    [_imageV sd_setImageWithURL:url];
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
