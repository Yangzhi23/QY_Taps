//
//  YZ_Base_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//


#import "YZ_Base_ViewController.h"

#import "YZNetTool.h"

@interface YZ_Base_ViewController ()

@end

@implementation YZ_Base_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;//把导航栏变为不透明
    
    self.automaticallyAdjustsScrollViewInsets = NO;/****它是改变的bar的****************/
    self.navigationItem.title = @"QY_Tips";
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];//导航栏的颜色
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
