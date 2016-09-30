
//
//  YZ_Recommend_Model.m
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Recommend_Model.h"

@implementation YZ_Recommend_Model


-(void)setSubitems:(NSMutableArray *)subitems{
    
    _subitems = subitems;
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dic in _subitems) {
    
        YZ_RItem_Model *subModel = [[YZ_RItem_Model alloc] init];
        
        [subModel setValuesForKeysWithDictionary:dic];
        
        [array addObject:subModel];
        
    }
    
    _subitems = [NSMutableArray arrayWithArray:array];
    

}

- (void)setCover:(NSString *)cover {
    NSMutableString *str = [NSMutableString stringWithString:cover];
    [str replaceOccurrencesOfString:@"webp" withString:@"jpg" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
    _cover = str;
}













@end
