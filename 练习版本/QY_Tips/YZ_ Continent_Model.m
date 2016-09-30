
//
//  YZ_ Continent_Model.m
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_ Continent_Model.h"

@implementation YZ__Continent_Model


-(void)setHot_country:(NSMutableArray *)hot_country{
    
    _hot_country = hot_country;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dic in _hot_country) {
        
        YZ__Country_Model *model = [[YZ__Country_Model alloc] initWithDic:dic];
        
        [array addObject:model];
        
    }
    
    _hot_country = [NSMutableArray arrayWithArray:array];

}



-(void)setCountry:(NSMutableArray *)country{
    
    _country = country;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dic in _country) {
        
        YZ__Country_Model *model = [[YZ__Country_Model alloc] initWithDic:dic];
        
        [array addObject:model];
        
    }
    
    _country = [NSMutableArray arrayWithArray:array];
    
    
}













@end
