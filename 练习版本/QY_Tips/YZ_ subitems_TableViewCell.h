//
//  YZ_ subitems_TableViewCell.h
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_TableViewCell.h"

#import "YZ_Recommend_Model.h"

@interface YZ__subitems_TableViewCell : YZ_Base_TableViewCell

@property (nonatomic, strong) YZ_Recommend_Model *recommendModel;

@property (nonatomic, strong) NSMutableArray *dataArray;//最后subitems数组添加到dataArray

@end
