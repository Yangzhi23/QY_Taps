//
//  YZ_Discount_TableviewCell.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//


#import "YZ_Discount_TableviewCell.h"
#import "YZ_DiscountCell.h"
#import <UIImageView+WebCache.h>
@interface YZ_Discount_TableviewCell ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation YZ_Discount_TableviewCell

//第二个分区discount_topic


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubView];
    }
    
    return self;
}


-(void)createSubView{
    

    self.myTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.rowHeight = 120;
    _myTableView.scrollEnabled = NO;
    [self.contentView addSubview:_myTableView];
    
    self.myView = [UIView new];
    _myView.backgroundColor = [UIColor yellowColor];        //***
     self.myView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 125);
    self.myTableView.tableHeaderView = _myView;
    
    self.imageV = [UIImageView new];
    _imageV.backgroundColor = [UIColor blueColor];
    [_myView addSubview:_imageV];
    [self.myTableView registerClass:[YZ_DiscountCell class] forCellReuseIdentifier:@"cell"];
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    _myTableView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 480 );
    self.myView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 125);
    self.imageV.frame = self.myView.bounds;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_DiscountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.listMocel = _listArray[indexPath.row];
    
    cell.backgroundColor = [UIColor cyanColor];
    
    return cell;
}


//点出字典
-(void)setAreaMocel:(NSDictionary *)areaMocel{
    
    _areaMocel = areaMocel;
 
    NSString *string = [_areaMocel objectForKey:@"photo"];
    NSURL *url = [NSURL URLWithString:string];
    [self.imageV sd_setImageWithURL:url];
    
    [self.myTableView reloadData];
    
}

-(void)setListModel:(YZ_Hot_area_Model *)listModel{
    
    _listModel = listModel;
  
    _listArray = [NSMutableArray arrayWithArray:listModel.list];
//    NSLog(@"-==-=-==%@",_listArray);
    [self.myTableView reloadData];
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
