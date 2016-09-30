//
//  YZ_Subitem_CollectionViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Subitem_CollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_Subitem_CollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageName;
@property (nonatomic, strong) UILabel *itemName;

@property (nonatomic, strong) UIImageView *imagepo;

@end

@implementation YZ_Subitem_CollectionViewCell

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
    _imageV.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_imageV];
    
    self.label = [UILabel new];
    _label.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_label];
    
    self.imageName = [UIImageView new];
    _imageName.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_imageName];
    
    self.itemName = [UILabel new];
    _itemName.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_itemName];
    
    self.imagepo = [UIImageView new];
    _imagepo.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imagepo];
    
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _imageV.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height / 2 - 10);
    _label.frame = CGRectMake(10, _imageV.frame.origin.y + _imageV.frame.size.height + 5, _imageV.frame.size.width - 20, 40);
    _imageName.frame = CGRectMake(_label.frame.origin.x, _label.frame.origin.y + _label.frame.size.height + 5, 30, 30);
    
    _itemName.frame = CGRectMake(_imageName.frame.origin.x + _imageName.frame.size.width + 5, _imageName.frame.origin.y, 70, 30);
    
}


-(void)setRitemModel:(YZ_RItem_Model *)ritemModel{
    
    _ritemModel = ritemModel;
    
    NSURL *url = [NSURL URLWithString:ritemModel.item_cover];
    [self.imageV sd_setImageWithURL:url];
    
    _label.text = ritemModel.item_name;
    
    _label.text = ritemModel.item_address;
}















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
