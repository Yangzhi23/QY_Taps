//
//  UINavigationBar+YZAlphaBar.h
//  QY_ Travel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (YZAlphaBar)

// 分类的作用  可以添加方法 添加属性
@property (nonatomic , strong)UIView *AlphaView;

// 提供一个渐变透明的方法
- (void)changeNavAlphaWithColor:(UIColor *)color;



@end
