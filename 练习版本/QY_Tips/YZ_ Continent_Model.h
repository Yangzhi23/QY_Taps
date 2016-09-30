//
//  YZ_ Continent_Model.h
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_ Country_Model.h"

#import "YZ_ Continent_Model.h"

@interface YZ__Continent_Model : YZ_Base_Model

@property (nonatomic, strong) NSString *cnname;//亚洲
@property (nonatomic, strong) NSMutableArray *hot_country;
@property (nonatomic, strong) NSMutableArray *country;
//@property (nonatomic, strong) NSMutableArray *photo;

@end
