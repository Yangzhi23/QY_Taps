//
//  YZ_ authorStart_TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_ authorStart_TableViewCell.h"
#import <UIImageView+WebCache.h>

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface YZ__authorStart_TableViewCell ()

@property (nonatomic, strong) UILabel *columLabel;
@property (nonatomic, strong) UIImageView *imagePhoto;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UIImageView *icon_urlImage;

@property (nonatomic, strong) UIImageView *authorImage;
@property (nonatomic, strong) UILabel *nameLabel;


@end


@implementation YZ__authorStart_TableViewCell


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
    _columLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:self.columLabel];
    
    self.titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.subjectLabel = [UILabel new];
    _subjectLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_subjectLabel];
    _subjectLabel.numberOfLines = 0;
    _subjectLabel.font = [UIFont systemFontOfSize:15];
    
    self.icon_urlImage = [UIImageView new];
    _icon_urlImage.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_icon_urlImage];
    
//******
    self.authorImage = [UIImageView new];
    _authorImage.backgroundColor = [UIColor blueColor];
    [self.imagePhoto addSubview:_authorImage];
    
    self.nameLabel = [UILabel new];
    _nameLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_nameLabel];
    
    
}



-(void)layoutSubviews{
    
    
    [super layoutSubviews];
    
    _imagePhoto.frame = CGRectMake(0, 0, WIDTH, 120);
    
     _columLabel.frame = CGRectMake(_imagePhoto.frame.origin.x + 10, 10, _imagePhoto.frame.size.width / 4, 20);
    
    _authorImage.frame = CGRectMake(WIDTH / 2 - 32, 80, 60, 60);
    _authorImage.layer.masksToBounds = YES;
    _authorImage.layer.cornerRadius = 30;
    
    _nameLabel.frame = CGRectMake(_authorImage.frame.origin.x - 5 , _authorImage.frame.origin.y + _authorImage.frame.size.height + 10, 70, 20);
    
    _titleLabel.frame = CGRectMake(_imagePhoto.frame.origin.x + 60, _imagePhoto.frame.origin.y + _imagePhoto.frame.size.height + 64, WIDTH - 100, 60);
    
    _subjectLabel.frame = CGRectMake(_titleLabel.frame.origin.x - 15, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, WIDTH - (_titleLabel.frame.origin.x - 15) * 2 + 20, 70);
    
    _icon_urlImage.frame = CGRectMake(WIDTH / 2 - 15, _subjectLabel.frame.origin.y + _subjectLabel.frame.size.height + 15, 40, 40);
}


-(void)setRecoModel:(YZ_Recommend_Model *)recoModel{
    
    _recoModel = recoModel;

    NSURL *url = [NSURL URLWithString:recoModel.cover];
    [self.imagePhoto sd_setImageWithURL:url];
    
    _titleLabel.text = recoModel.title;
    _subjectLabel.text = recoModel.subject;
    
    NSURL *urlIcon = [NSURL URLWithString:recoModel.icon_url];
    [self.icon_urlImage sd_setImageWithURL:urlIcon];
    
    _columLabel.text = recoModel.column;

    NSDictionary *dic = recoModel.author;
    NSString *string = [dic objectForKey:@"username"];
    self.nameLabel.text = string;

    NSString *urlPic = [dic objectForKey:@"pic"];
    [self.authorImage sd_setImageWithURL:[NSURL URLWithString:urlPic]];
    
}














/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
