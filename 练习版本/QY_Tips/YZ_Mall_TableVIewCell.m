//
//  YZ_Mall_TableVIewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Mall_TableVIewCell.h"
#import <UIButton+WebCache.h>
@interface YZ_Mall_TableVIewCell ()

@property (nonatomic, strong) UIImageView *imageSaleV;
@property (nonatomic, strong) UIImageView *imageTicketV;
@property (nonatomic, strong) UIImageView *imageVisaV;

@end


@implementation YZ_Mall_TableVIewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }
    
    return self;
    
}


-(void)createSubView{
    
    self.imageSaleV = [UIImageView new];
    _imageSaleV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imageSaleV];
    
    self.imageTicketV = [UIImageView new];
    _imageTicketV.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_imageTicketV];
    
    self.imageVisaV = [UIImageView new];
    _imageVisaV.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_imageVisaV];
    
}


-(void)layoutSubviews{

    [super layoutSubviews];

    self.imageSaleV.frame = CGRectMake(0, 4.4, self.bounds.size.width / 2,self.bounds.size.height - 9);
    
    self.imageTicketV.frame = CGRectMake(_imageSaleV.frame.origin.x + _imageSaleV.frame.size.width + 2, _imageSaleV.frame.origin.y, self.bounds.size.width - _imageSaleV.frame.size.width - 2, _imageSaleV.frame.size.height / 2 - 0.8);
    
    self.imageVisaV.frame = CGRectMake(_imageTicketV.frame.origin.x, _imageTicketV.frame.origin.y + _imageTicketV.frame.size.height + 1.5, _imageTicketV.frame.size.width, _imageTicketV.frame.size.height - 0.8);
}


-(void)setArr:(NSMutableArray *)arr{
    _arr = arr;
    
    if (_arr.count != 0) {
        
        YZ_Mall_Model *model = _arr[0];
        YZ_Mall_Model *modelTick = _arr[1];
        YZ_Mall_Model *modelVisaV = _arr[2];
        [self.imageSaleV sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@""]];
        [self.imageTicketV sd_setImageWithURL:[NSURL URLWithString:modelTick.pic] placeholderImage:[UIImage imageNamed:@""]];
        [self.imageVisaV sd_setImageWithURL:[NSURL URLWithString:modelVisaV.pic] placeholderImage:[UIImage imageNamed:@""]];
        
    }

}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
