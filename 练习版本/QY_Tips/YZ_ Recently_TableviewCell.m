//
//  YZ_ Recently_TableviewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#define WIDTH self.frame.size.width
#define HEIGHT  self.frame.size.height

#import <UIImageView+WebCache.h>

#import "YZ_ Recently_TableviewCell.h"

@interface YZ__Recently_TableviewCell ()

@property (nonatomic, strong) UIImageView *imageV;//大图片(巴厘岛)
@property (nonatomic, strong) UILabel *titleLbel;//标题
@property (nonatomic, strong) UILabel *city_nameLabel;//巴厘岛


@property (nonatomic, strong) UIImageView *jingImage;//4个图标
@property (nonatomic, strong) UIImageView *meiImage;
@property (nonatomic, strong) UIImageView *jinImage;
@property (nonatomic, strong) UIImageView *shouImage;

@property (nonatomic, strong) UIButton *jingButton;//图标下标题
@property (nonatomic, strong) UIButton *meiButton;
@property (nonatomic, strong) UIButton *jinButton;
@property (nonatomic, strong) UIButton *shouButton;
@property (nonatomic, strong) UILabel *cityLabel;//更多城市
@property (nonatomic, strong) UIButton *baButton;//更多城市下面的三个
@property (nonatomic, strong) UIButton *fuButton;
@property (nonatomic, strong) UIButton *moButton;

@property (nonatomic, strong) UILabel *la;

@end

@implementation YZ__Recently_TableviewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }
    return self;
}


-(void)createSubView{

    self.imageV = [UIImageView new];
    _imageV.userInteractionEnabled = YES;
    _imageV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imageV];
//    给图片加手势,以便可以点进去
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [_imageV addGestureRecognizer:tap];//添加手势的方法
        tap.numberOfTapsRequired = 2;//设置轻拍的次数

    
    
    self.titleLbel = [UILabel new
                      ];
    _titleLbel.font = [UIFont systemFontOfSize:15];
//    _titleLbel.backgroundColor = [UIColor blueColor];
    [self.imageV addSubview:_titleLbel];
    
    self.city_nameLabel = [UILabel new];
    _city_nameLabel.font = [UIFont systemFontOfSize:25];
    _city_nameLabel.textColor = [UIColor whiteColor];
//    _city_nameLabel.backgroundColor = [UIColor blueColor];
    [self.imageV addSubview:_city_nameLabel];
    
    
    
    self.jingImage = [UIImageView new];
    _jingImage.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_jingImage];
    
    self.meiImage = [UIImageView new];
    _meiImage.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_meiImage];
    
    self.jinImage = [UIImageView new];
    _jinImage.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_jinImage];
    
    self.shouImage = [UIImageView new];
    _shouImage.backgroundColor = [UIColor brownColor];
    [self.contentView addSubview:_shouImage];
    
    self.jingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _jingButton.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_jingButton];
    
    self.meiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _meiButton.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:_meiButton];
    
    self.jinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _jinButton.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_jinButton];
    
    self.shouButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shouButton.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_shouButton];
    
    self.cityLabel = [UILabel new];
    _cityLabel.backgroundColor = [UIColor greenColor];
    _cityLabel.text = @"  ---------------------更多城市------------------- ";
    [self.contentView addSubview:_cityLabel];
    
    self.baButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _baButton.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_baButton];
    
    self.fuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _fuButton.backgroundColor = [UIColor brownColor];
    [self.contentView addSubview:_fuButton];
    
    self.moButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moButton.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_moButton];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    _imageV.frame = CGRectMake(10, 10, WIDTH - 20, 180);
    _titleLbel.frame = CGRectMake(_imageV.frame.origin.x + WIDTH / 2 - 50, _imageV.frame.origin.y + 10, 80, 30);
    _city_nameLabel.frame = CGRectMake(_imageV.frame.origin.x + WIDTH / 2 - 60, _imageV.frame.origin.y + 50, 100, 50);

    _jingImage.frame = CGRectMake(_imageV.frame.origin.x + 20 + 2, _imageV.frame.origin.x + _imageV.size.height + 15, 50, 50);
    _meiImage.frame = CGRectMake(_jingImage.frame.origin.x + _jingImage.frame.size.width + 50 + 2, _jingImage.frame.origin.y,50 , 50);
    
    _jinImage.frame = CGRectMake(_meiImage.frame.origin.x + _meiImage.frame.size.width + 50 + 2, _meiImage.frame.origin.y, 50, 50);
    _shouImage.frame = CGRectMake(_jinImage.frame.size.width + _jinImage.frame.origin.x + 50 + 2, _jinImage.frame.origin.y, 50, 50);
    
    _jingButton.frame = CGRectMake(_jingImage.frame.origin.x - 20, _jingImage.frame.origin.y + _jingImage.frame.size.height + 10, _jingImage.frame.size.width + 25, 40);
    _meiButton.frame = CGRectMake(_meiImage.frame.origin.x, _meiImage.frame.origin.y + _meiImage.frame.size.height + 10, _meiImage.frame.size.width, 40);
    _jinButton.frame = CGRectMake(_jinImage.frame.origin.x, _jinImage.frame.origin.y + _jinImage.frame.size.height + 10, _jinImage.frame.size.width, 40);
    _shouButton.frame = CGRectMake(_shouImage.frame.origin.x - 20, _shouImage.frame.origin.y + _shouImage.frame.size.height + 10, _shouImage.frame.size.width + 40, 40);
    
    _cityLabel.frame = CGRectMake(0, _meiButton.frame.origin.y + 65, WIDTH, 20);
    

    
    _baButton.frame = CGRectMake(20 + 2, _cityLabel.frame.origin.y + _cityLabel.frame.size.height + 30, WIDTH / 3 - 25, 40);
    _fuButton.frame = CGRectMake(_baButton.frame.origin.x + _baButton.frame.size.width + 15 + 1.5, _baButton.frame.origin.y, WIDTH / 3 - 25, 40);
    _moButton.frame = CGRectMake(_fuButton.frame.size.width + _fuButton.frame.origin.x + 15 + 1.5, _fuButton.frame.origin.y, WIDTH / 3 - 25, 40);
    
}


//
-(void)setDic23:(NSMutableDictionary *)dic23{
    
    _dic23 = dic23;
    
    self.titleLbel.text = [dic23 objectForKey:@"title"];
    self.city_nameLabel.text = [dic23 objectForKey:@"city_name"];

   NSString *str = [dic23 objectForKey:@"cover"];
    
  [self.imageV sd_setImageWithURL:[NSURL URLWithString:str]];
    
}


-(void)setArray23:(NSMutableArray *)array23{
    
     _array23 = array23;
    
    if (_array23.count) {
        
        NSDictionary *dic = array23[0];
        NSString *string = [dic objectForKey:@"name"];
        [_jingButton setTitle:string forState:UIControlStateNormal];

        [_meiButton setTitle:[array23[1]objectForKey:@"name"] forState:UIControlStateNormal];
        [_jinButton setTitle:[array23[2]objectForKey:@"name"] forState:UIControlStateNormal];
        [_shouButton setTitle:[array23[3]objectForKey:@"name"] forState:UIControlStateNormal];
        
    
        
        [_jingImage sd_setImageWithURL:[NSURL URLWithString:[array23[0]objectForKey:@"icon_url"]]];
        [_meiImage sd_setImageWithURL:[NSURL URLWithString:[array23[1]objectForKey:@"icon_url"]]];
        [_jinImage sd_setImageWithURL:[NSURL URLWithString:[array23[2]objectForKey:@"icon_url"]]];
        [_shouImage sd_setImageWithURL:[NSURL URLWithString:[array23[3]objectForKey:@"icon_url"]]];
   
    }
}


-(void)setRecommend_cityArr:(NSMutableArray *)recommend_cityArr{
    
    _recommend_cityArr = recommend_cityArr;
    
    if (_recommend_cityArr.count) {
        
        [_baButton setTitle:[recommend_cityArr[0]objectForKey:@"city_name"] forState:UIControlStateNormal];
        [_fuButton setTitle:[recommend_cityArr[1]objectForKey:@"city_name"] forState:UIControlStateNormal];
        [_moButton setTitle:[recommend_cityArr[2]objectForKey:@"city_name"] forState:UIControlStateNormal];
    }
    
    
}

//图片
-(void)tapAction:(UITapGestureRecognizer *)tap{
    
//    第三步,代理人执行协议方法
    [self.myDelegate dosomeThing];
    
//    NSLog(@"TYHUJO");
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
