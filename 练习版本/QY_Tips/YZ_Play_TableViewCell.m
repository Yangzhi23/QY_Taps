//
//  YZ_Play_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/25.
//  Copyright © 2016年 杨志. All rights reserved.
//

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

#import "YZ_Play_TableViewCell.h"

@interface YZ_Play_TableViewCell ()

@property (nonatomic, strong) UILabel *columLabel;
@property (nonatomic, strong) UIImageView *imagePhoto;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UIImageView *icon_urlImage;

@property (nonatomic, strong) UIImageView *playImage;
@property (nonatomic, strong) UILabel *grayLabel;

@end

@implementation YZ_Play_TableViewCell

//带播放按钮的cell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }
    
    return self;
}


-(void)createSubView{
    
    self.imagePhoto = [UIImageView new];
    _imagePhoto.backgroundColor = [UIColor redColor];
    [self addSubview:self.imagePhoto];
    
    self.columLabel = [UILabel new];
    _columLabel.backgroundColor = [UIColor greenColor];
    [_imagePhoto addSubview:_columLabel];
    
    self.titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.subjectLabel = [UILabel new];
    _subjectLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_subjectLabel];
    _subjectLabel.numberOfLines = 0;
    _subjectLabel.font = [UIFont systemFontOfSize:15];
    
    self.icon_urlImage = [UIImageView new];
    _icon_urlImage.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_icon_urlImage];
    
    self.grayLabel = [UILabel new];
    _grayLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_grayLabel];
    
    self.playImage = [UIImageView new];
    _playImage.backgroundColor = [UIColor magentaColor];
    UIImage *image = [UIImage imageNamed:@"P.png"];
    _playImage.image = image;
    [self.imagePhoto addSubview:_playImage];
    
}



-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _imagePhoto.frame = CGRectMake(0, 0, WIDTH, 150);
    
    _columLabel.frame = CGRectMake(_imagePhoto.frame.origin.x + 10, 10, _imagePhoto.frame.size.width / 4, 20);
   
    _titleLabel.frame = CGRectMake(_imagePhoto.frame.origin.x + 60, _imagePhoto.frame.origin.y + _imagePhoto.frame.size.height + 15, WIDTH - 100, 60);
    
    _subjectLabel.frame = CGRectMake(_titleLabel.frame.origin.x - 15, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, WIDTH - (_titleLabel.frame.origin.x - 15) * 2 + 20, 70);
    
    _icon_urlImage.frame = CGRectMake(WIDTH / 2 - 15, _subjectLabel.frame.origin.y + _subjectLabel.frame.size.height + 15, 40, 40);
    
    _grayLabel.frame = CGRectMake(0, self.contentView.height - 10, WIDTH, 10);
    
    _playImage.frame = CGRectMake(_imagePhoto.frame.size.width / 2 - 15, _imagePhoto.frame.size.height / 2 - 15, 50, 50);
    
}


-(void)setRecomendModel:(YZ_Recommend_Model *)recomendModel{
    
    _recomendModel = recomendModel;
    
    _recomendModel = recomendModel;
    
    NSURL *url = [NSURL URLWithString:recomendModel.cover];
    [self.imagePhoto sd_setImageWithURL:url];
    
    _titleLabel.text = recomendModel.title;
    _subjectLabel.text = recomendModel.subject;
    
    NSURL *urlIcon = [NSURL URLWithString:recomendModel.icon_url];
    [self.icon_urlImage sd_setImageWithURL:urlIcon];
    
    _columLabel.text = recomendModel.column;


    
    
    
}

















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
