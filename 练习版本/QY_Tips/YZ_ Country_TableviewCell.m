//
//  YZ_ Country_TableviewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_ Country_TableviewCell.h"

#define WIDTH self.frame.size.width

@interface YZ__Country_TableviewCell ()

@property (nonatomic, strong) UILabel *cnnameLabel;

@property(nonatomic, strong) UILabel *ennameLabel;

@property(nonatomic, strong) UILabel *lineLabe;//线
@end

@implementation YZ__Country_TableviewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createSubView];
    }
    return self;
    
}

-(void)createSubView{
    
    self.cnnameLabel = [UILabel new];
    _cnnameLabel.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_cnnameLabel];
    
    
    self.ennameLabel = [UILabel new];
    _ennameLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_ennameLabel];
    
    
    self.lineLabe = [UILabel new];
    _lineLabe.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_lineLabe];
    
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.cnnameLabel.frame = CGRectMake(20, 10, 80, 40);
    self.ennameLabel.frame = CGRectMake(_cnnameLabel.frame.origin.x + _cnnameLabel.frame.size.width + 10, _cnnameLabel.frame.origin.y + 15, 100, 25);

    self.lineLabe.frame = CGRectMake(_cnnameLabel.frame.origin.x, _cnnameLabel.frame.origin.y + 5 + _cnnameLabel.frame.size.height + 10, WIDTH - 20, 2);
    
}



-(void)setCountryMocel:(YZ__Country_Model *)countryMocel{
    
    _countryMocel = countryMocel;
    
    _cnnameLabel.text = countryMocel.cnname;
    _ennameLabel.text = countryMocel.enname;
    
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
