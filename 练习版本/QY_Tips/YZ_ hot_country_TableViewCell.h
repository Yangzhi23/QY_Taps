//
//  YZ_ hot_country_TableViewCell.h
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_TableViewCell.h"
#import "YZ_ Continent_Model.h"

@protocol doIt <NSObject>

-(void)doSomething;

@end


@interface YZ__hot_country_TableViewCell : YZ_Base_TableViewCell

@property (nonatomic, strong) YZ__Continent_Model *hot_countryModel;
@property (nonatomic, strong) NSMutableArray *dataArray;



@property (nonatomic,assign) id<doIt>myDelegate;

@end

