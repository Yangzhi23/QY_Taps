
//
//  YZ_Hot_area_Model.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Hot_area_Model.h"
#import "YZ_HotList_Model.h"

@implementation YZ_Hot_area_Model


 
 -(void)setPlace:(NSMutableArray *)place{
    
    _place = place;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dic in _place) {
        
        YZ_HotList_Model *model = [[YZ_HotList_Model alloc] initWithDic:dic];
        
        [array addObject:model];
    }
    
    
    _place = [NSMutableArray arrayWithArray:array];
    
    
}



-(void)setList:(NSMutableArray *)list{
    
    _list = list;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dic in _list) {
        
        YZ_HotList_Model *model = [[YZ_HotList_Model alloc] initWithDic:dic];
        
        [array addObject:model];
    }
    
    _list = [NSMutableArray arrayWithArray:array];
    
}
















@end
