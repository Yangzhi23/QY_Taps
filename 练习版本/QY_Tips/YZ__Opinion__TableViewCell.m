//
//  YZ__Opinion__TableViewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ__Opinion__TableViewCell.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface YZ__Opinion__TableViewCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *nowLabel;//现在出发

@end


@implementation YZ__Opinion__TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }

    return self;
}


-(void)createSubView{
    
    self.imageV = [UIImageView new];
    _imageV.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:_imageV];
    
    self.button = [UIButton new];
    _button.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_button];
    
    self.nowLabel = [UILabel new];
    _nowLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_nowLabel];
    _nowLabel.text = @"现在出发";
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(20, 40, 30, 30);
    self.button.frame = CGRectMake(_imageV.frame.origin.x + _imageV.frame.size.width + 10, _imageV.frame.origin.y - 5, WIDTH - 100, 40);
    _nowLabel.frame = CGRectMake(WIDTH / 2 - 20, HEIGHT - 50, 70, 25);
    
}

//点评我帮助更多的er
-(void)setCommentDic:(NSMutableDictionary *)commentDic{
    
    _commentDic = commentDic;
    
    NSString *string = [commentDic objectForKey:@"title"];
    [_button setTitle:string forState:UIControlStateNormal];
    
    
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
