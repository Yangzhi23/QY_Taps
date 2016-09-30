//
//  UIButton+Block.h
//  QY_ Travel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef void (^Callback)();

@interface UIButton (Block)

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(Callback)block;

@end
