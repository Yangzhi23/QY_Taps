//
//  YZ_Discount_TableviewCell.h
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_TableViewCell.h"
#import "YZ_Hot_area_Model.h"
#import "YZ_HotList_Model.h"
@interface YZ_Discount_TableviewCell : YZ_Base_TableViewCell


@property (nonatomic, strong) NSDictionary *areaMocel;

@property (nonatomic, strong) YZ_Hot_area_Model *listModel;
@property (nonatomic, strong) NSMutableArray *listArray;

@end
