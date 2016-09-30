//
//  YZ_Place_TableViewCell.h
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_TableViewCell.h"
#import "YZ_Hot_area_Model.h"
@interface YZ_Place_TableViewCell : YZ_Base_TableViewCell

@property (nonatomic, strong) YZ_Hot_area_Model *areaMocel;

@property (nonatomic, strong) NSMutableArray *placeArray;
@property (nonatomic, strong) NSMutableArray *array;

@end
