//
//  YZ_ Recently_TableviewCell.h
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_TableViewCell.h"
#import "YZ_Recommend_Model.h"

//声明协议
@protocol doIt <NSObject>

-(void)dosomeThing;


@end

@interface YZ__Recently_TableviewCell : YZ_Base_TableViewCell

@property (nonatomic, strong) NSMutableDictionary *dic23;

@property (nonatomic, strong) NSMutableArray *array23;
@property (nonatomic, strong) NSMutableArray *recommend_cityArr;





//声明代理

@property (nonatomic, assign)id<doIt>myDelegate;



@end
