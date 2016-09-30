//
//  YZ_HotList_Model.h
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_Model.h"

@interface YZ_HotList_Model : YZ_Base_Model


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, assign) NSInteger *ID;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *sold;
//第二个分区的model
@property (nonatomic, copy) NSString *area;

@end
