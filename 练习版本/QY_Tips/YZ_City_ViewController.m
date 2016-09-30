
//
//  YZ_City_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/29.
//  Copyright © 2016年 杨志. All rights reserved.
//


#import "YZ_City_ViewController.h"
#import "YZ_City_TableViewCell.h"
#import "YZ_City_Model.h"

@interface YZ_City_ViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) NSMutableArray *photosArray;//轮播图数组
@property (nonatomic, strong) NSMutableArray *icon_listArray;
@property (nonatomic, strong) MyScrollView *scrollView;//调取scrollview的轮播图
@end

@implementation YZ_City_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.photosArray = [NSMutableArray array];
    self.icon_listArray = [NSMutableArray array];
    [self afnHandle];
    
    
    self.myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    

    
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 220)];
    _myView.backgroundColor = [UIColor yellowColor];
    _myTableView.tableHeaderView = _myView;
    self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:_myTableView];
    
    self.scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, _myView.frame.size.height)];
    [_myView addSubview:_scrollView];
    
    [self.myTableView registerClass:[YZ_City_TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_City_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.cityArray = _icon_listArray;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220;
}


//scrollview的偏移量
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetH = self.scrollView.height + offsetY;
//    NSLog(@"-----%f",offsetH);
//    if (offsetH < 200) {
//        CGRect frame = self.scrollView.frame;
//        frame.origin.y = -self.scrollView.frame.size.height + offsetH;//偏移了多少
//        frame.size.height = self.scrollView.frame.size.height - offsetH;//tableview向下偏移了多少,高度就是多少
//        self.scrollView.frame = frame;
//    }else{
//
//        self.scrollView.frame = CGRectMake(0, -self.scrollView.size.height, WIDTH, self.scrollView.frame.size.height);
//
//    }

    
    CGFloat alpha = offsetH / self.scrollView.size.height;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor magentaColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];

    
    
}


#pragma mark - 返回一张纯色图片
/** 返回一张纯色图片 */
- (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}





//使用afn进行网络请求
-(void)afnHandle{
    
       NSString *string = @"http://open.qyer.com/qyer/footprint/country_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&country_id=14&page=1&track_app_channel=App%2520Store&track_app_version=7.0.3&track_device_info=iPhone%25205c&track_deviceid=4331AEED-1B57-45FB-87C9-D9421ECD697F&track_os=ios%25209.3.5&v=1";
    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
       
        NSDictionary *bigDic = result;
        
        NSDictionary *dataDic = [bigDic objectForKey:@"data"];
        NSMutableArray *photosArray = [dataDic objectForKey:@"photos"];
        
        for (NSDictionary *photosString in photosArray) {
            [self.photosArray addObject:photosString];
        }
        
        NSMutableArray *icon_listArray = [dataDic objectForKey:@"icon_list"];
        for (NSDictionary *dic in icon_listArray) {
            YZ_City_Model *model = [[YZ_City_Model alloc] initWithDic:dic];
            [self.icon_listArray addObject:model];
        }
        
        
        

        [self.myTableView reloadData];
        
        [self.scrollView setImages:_photosArray];
        
        
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
