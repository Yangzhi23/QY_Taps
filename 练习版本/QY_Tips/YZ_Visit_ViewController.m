//
//  YZ_Visit_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Visit_ViewController.h"


@interface YZ_Visit_ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *myView;

@end

@implementation YZ_Visit_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 600)];
    _myView.backgroundColor = [UIColor cyanColor];
    self.myTableView.tableHeaderView = _myView;
    [self.view addSubview:_myTableView];
    
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}


//使用afn进行网络请求
-(void)afnHandle{
    
    NSString *string = @"http://open.qyer.com/qyer/place/city_index?city_id=9492&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&page=1&track_app_channel=App%2520Store&track_app_version=7.0.3&track_device_info=iPhone%25205c&track_deviceid=4331AEED-1B57-45FB-87C9-D9421ECD697F&track_os=ios%25209.3.5&v=1";
    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
       
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
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
