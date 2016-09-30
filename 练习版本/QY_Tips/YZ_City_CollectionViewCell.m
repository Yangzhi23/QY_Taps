//
//  YZ_City_CollectionViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/30.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_City_CollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_City_CollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *label;

@end
@implementation YZ_City_CollectionViewCell


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
    _imageV.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_imageV];
    
    self.label = [UILabel new];
    _label.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_label];
    _label.textAlignment = NSTextAlignmentCenter;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _imageV.frame = CGRectMake(0, 0, self.bounds.size.width, 50);
    _label.frame = CGRectMake(_imageV.frame.origin.x, _imageV.frame.origin.y + _imageV.frame.size.height + 20, _imageV.frame.size.width, 25);
}




-(void)setCityModel:(YZ_City_Model *)cityModel{
    _cityModel = cityModel;
    
    NSURL *url = [NSURL URLWithString:cityModel.icon_pic];
    [_imageV sd_setImageWithURL:url];
    
    _label.text = cityModel.icon;
    
}













/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
