//
//  YZ_Recommend_Model.h
//  QY_Tips
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Base_Model.h"

#import "YZ_RItem_Model.h"

@interface YZ_Recommend_Model : YZ_Base_Model

@property (nonatomic, assign) NSInteger type;//根据type判断分区cell的类型1,2,3
@property (nonatomic, copy) NSString *column; //最会吃(左上角的标签)
@property (nonatomic, copy) NSString *title;  //"韩国人原来是这样吃烤肉的……",
@property (nonatomic, copy) NSString *subject; //   "subject": "韩国烤肉不只是生菜包肉那么简单，来看看韩国人地道的吃法吧。"
@property (nonatomic, copy) NSString *cover;     //图片
@property (nonatomic, copy) NSString *icon_url;   //标记"icon_url": "http://pic.qyer.com/public/place/iconconfig/2016/07/14/14684648561912",

@property (nonatomic, strong) NSDictionary *author;//"author": { },
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *pic;

@property (nonatomic, strong) NSMutableArray *subitems; // item数组


//"author": {
//    "username": "annie215",
//    "pic": "http://pic4.qyer.com/avatar/001/01/83/90/index/200?v="
//},






@end
