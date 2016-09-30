//
//  YZ_Hot_area_Model.h
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_Model.h"

@interface YZ_Hot_area_Model : YZ_Base_Model

@property (nonatomic, copy) NSString *type;//类型
//2个数组model
@property (nonatomic, strong) NSMutableArray *place;
@property (nonatomic, strong) NSMutableArray *list;

//第二个分区model也使用第一个分区model
@property (nonatomic, strong) NSMutableDictionary *topic;//字典model



@end
