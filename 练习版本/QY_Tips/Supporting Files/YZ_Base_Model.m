
//
//  YZ_Base_Model.m
//  QY_Tips
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_Model.h"

@implementation YZ_Base_Model

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (void)setNilValueForKey:(NSString *)key{
    
}



@end
