//
//  YZ_Top_CollectionViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Top_CollectionViewCell.h"

@interface YZ_Top_CollectionViewCell ()



@end

@implementation YZ_Top_CollectionViewCell


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
//    _imageV.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_imageV];
    
    
    self.label = [UILabel new];
//    _label.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_label];
    _label.font = [UIFont systemFontOfSize:15];
    _label.textAlignment = NSTextAlignmentCenter;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 38);
    
    self.label.frame = CGRectMake(0, _imageV.frame.origin.y + _imageV.frame.size.height + 15, _imageV.frame.size.width, 28);
    
}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
