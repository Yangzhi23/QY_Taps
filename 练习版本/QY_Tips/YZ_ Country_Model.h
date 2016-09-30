//
//  YZ_ Country_Model.h
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_Model.h"

@interface YZ__Country_Model : YZ_Base_Model

@property (nonatomic, copy) NSString *cnname;//中国
//@property (nonatomic, copy) NSString *country;//China
@property (nonatomic, assign) NSInteger *count;//40
@property (nonatomic, strong) NSString *label;//城市
@property (nonatomic, strong) NSString *enname;
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSString *photo;//图片

@end
