//
//  AllTabBarController.m
//  QY_ Travel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "AllTabBarController.h"

@interface AllTabBarController ()

@end

@implementation AllTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    推荐
    YZ_Recommend_ViewController *recommendVC = [[YZ_Recommend_ViewController alloc] init];
    UINavigationController *commendNA = [[UINavigationController alloc] initWithRootViewController:recommendVC];
    commendNA.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:[[UIImage imageNamed:@"00.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]tag:10001];

    //    commendNA.title = @"推荐";
    
    
    
////目的地
    YZ_Destination_ViewController *destinationVC = [[YZ_Destination_ViewController alloc] init];
    UINavigationController *destinationNA = [[UINavigationController alloc] initWithRootViewController:destinationVC];
    destinationNA.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"目的地" image:[UIImage imageNamed:@"4.png"] tag:10002];
    
//    旅行商城
    YZ_Mall_ViewController *mallVC = [[YZ_Mall_ViewController alloc] init];
    UINavigationController *mallNA = [[UINavigationController alloc] initWithRootViewController:mallVC];
    mallNA.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"商城" image:[UIImage imageNamed:@"3.png"] tag:10003];
    
    
    
    
    self.viewControllers = @[commendNA,destinationNA,mallNA];
    
    
    
    
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
