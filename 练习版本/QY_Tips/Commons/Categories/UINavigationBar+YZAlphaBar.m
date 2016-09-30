//
//  UINavigationBar+YZAlphaBar.m
//  QY_ Travel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "UINavigationBar+YZAlphaBar.h"
#import <objc/runtime.h>

static char *AlphaV;

@implementation UINavigationBar (YZAlphaBar)

-(void)setAlphaView:(UIView *)AlphaView{
    
    objc_setAssociatedObject(self, &AlphaV, AlphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(UIView *)AlphaView{
    return objc_getAssociatedObject(self, &AlphaV);
}

-(void)changeNavAlphaWithColor:(UIColor *)color{
    
    if (!self.AlphaView) {
        
        //设置图片
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //创建AlphaView
//        self.AlphaView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, ScreenW, 64)];
        
        //插入到NavigationBar的上面
        [self insertSubview:self.AlphaView atIndex:0];
    }
    
    [self.AlphaView setBackgroundColor:color];
    
}







@end
