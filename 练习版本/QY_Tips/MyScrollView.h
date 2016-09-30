//
//  MyScrollView.h
//  QY轮播图
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIImageView+WebCache.h>

@interface MyScrollView : UIView

- (void)setImages:(NSMutableArray *)names;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, assign)NSInteger page;
@property(nonatomic,strong)NSTimer *myTimer;


@end
