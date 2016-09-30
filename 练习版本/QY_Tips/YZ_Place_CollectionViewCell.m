//
//  YZ_Place_CollectionViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Place_CollectionViewCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_Place_CollectionViewCell ()

@property (nonatomic, strong) UIImageView *photoImageV;
@property (nonatomic, strong) UILabel *nameLabel;




@end


@implementation YZ_Place_CollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubView];
    }
    return self;
}

-(void)createSubView{
    
    self.photoImageV = [UIImageView new];
    _photoImageV.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_photoImageV];
    
    self.nameLabel = [UILabel new];
    self.nameLabel.textColor = [UIColor whiteColor];
    [_photoImageV addSubview:_nameLabel];
    
       
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.photoImageV.frame = self.contentView.bounds;
    
    self.nameLabel.frame = CGRectMake(20, _photoImageV.frame.size.height / 2 - 10, _photoImageV.frame.size.width - 20, 25);

    
    
    
}



-(void)setListMocel:(YZ_HotList_Model *)listMocel{
    
    _listMocel = listMocel;
   
    NSURL *url = [NSURL URLWithString:listMocel.photo];
    [self.photoImageV sd_setImageWithURL:url];
    self.nameLabel.text = listMocel.name;
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
