//
//  YZ_Recommend_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#define CELL @"cell"

#import "YZ_Visit_ViewController.h"
#import "YZ_ Recently_TableviewCell.h"//首页上面(最近访问)
#import "YZ_Recommend_ViewController.h"
#import "YZ__Opinion__TableViewCell.h"
#import "YZ_ start_TableviewCell.h"
#import "YZ_ authorStart_TableViewCell.h"
#import "YZ_Play_TableViewCell.h"
#import "YZ_ subitems_TableViewCell.h"

#import "YZ_Recommend_Model.h"//model

@interface YZ_Recommend_ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,doIt>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *myView;


@property (nonatomic, strong) UITextField *myText;//搜索目的地

@property (nonatomic, strong) MyScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *sliderArray;
@property (nonatomic, strong) NSMutableArray *tabArray;
@property (nonatomic, strong) NSMutableArray *recommend_cityArray;

@property (nonatomic, strong) NSMutableArray *recommendArray;  //entry数组

@property (nonatomic, strong) NSMutableDictionary *recommendDic;//传字典
@property (nonatomic, strong) NSMutableDictionary *comment_entryDic;
@property (nonatomic, strong) NSMutableArray *arr;
@end

@implementation YZ_Recommend_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationController.navigationBarHidden = YES;
//    第一个区
    self.recommendDic = [NSMutableDictionary dictionary];
    self.comment_entryDic = [NSMutableDictionary dictionary];
    self.tabArray = [NSMutableArray array];
    self.recommend_cityArray = [NSMutableArray array];
    [self afnHandle];
    
    self.recommendArray = [NSMutableArray array];//entry数组
    self.sliderArray = [NSMutableArray array];
    [self afn];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 280)];
    _myView.backgroundColor = [UIColor cyanColor];
    _myTableView.tableHeaderView = _myView;
    
    
//  调取轮播图
    self.scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.myView.size.height - 60)];
    [_myView addSubview:self.scrollView];
    
//    下面搜索
    self.myText = [[UITextField alloc] initWithFrame:CGRectMake(10, _scrollView.origin.y + _scrollView.size.height + 5, WIDTH - 20, 50)];
    self.myText.backgroundColor = [UIColor redColor];
    [self.myView addSubview:_myText];
    _myText.layer.masksToBounds = YES;
    _myText.layer.cornerRadius = 10;
    _myText.placeholder = @"搜索目的地~帖子~特价~穷游er";
    
    
//    注册
    [self.myTableView registerClass:[YZ__Recently_TableviewCell class] forCellReuseIdentifier:@"cell1"];
    [self.myTableView registerClass:[YZ__Opinion__TableViewCell class] forCellReuseIdentifier:@"cell2"];
    
    [self.myTableView registerClass:[YZ__start_TableviewCell class] forCellReuseIdentifier:@"cell3"];
    [self.myTableView registerClass:[YZ__authorStart_TableViewCell class] forCellReuseIdentifier:@"cell4"];
    [self.myTableView registerClass:[YZ_Play_TableViewCell class] forCellReuseIdentifier:@"cell6"];
    [self.myTableView registerClass:[YZ__subitems_TableViewCell class] forCellReuseIdentifier:@"cell5"];
    

    
   
    
    
    // Do any additional setup after loading the view.
}
//返回区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (0 == section) {
        
        return 1;
    }
    if (1 == section) {
        
        return 1;
    }
    if (2 == section) {
        
        return _recommendArray.count;
    }
    
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        YZ__Recently_TableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        
        cell.dic23 = _recommendDic;
        cell.array23 = _tabArray;
        cell.recommend_cityArr = _recommend_cityArray;
//    第五步成为代理人
        cell.myDelegate = self;
        
        return cell;
    }
    if (indexPath.section == 1) {
        
        YZ__Opinion__TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        
        cell.backgroundColor = [UIColor cyanColor];
        
        cell.commentDic = _comment_entryDic;
        
        return cell;

    }
    if (indexPath.section == 2) {
     
        YZ_Recommend_Model *model = [_recommendArray objectAtIndex:indexPath.row];

        if (model.type == 1) {
          
            if (model.author.count == 0) {
                
                YZ__start_TableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
                
                cell.recommendModel = model;
                
                return cell;
                
            }else{
                
                YZ__authorStart_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
                
                cell.recoModel = model;
                
                return cell;
            }

        }
        if (model.type == 2) {
            
            YZ_Play_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
            
            cell.recomendModel = model;
            
            return cell;
        }
        if (model.type == 3) {
            
            YZ__subitems_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
            
            cell.recommendModel = model;
            
            return cell;
            
        }
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 430;
    }
    
    if (indexPath.section == 1) {
        
        return 200;
    }
    
    return 380;
}





//使用afn进行网络请求

-(void)afn{
    
    NSString *string = @"http://open.qyer.com/qyer/home/home_feed?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=38.8826414938483&lon=121.5393481716236&page=1&track_app_channel=App%2520Store&track_app_version=7.0.2&track_device_info=iPad%2520mini%2520%28Wifi%29&track_deviceid=AE6FB093-3107-447D-8CAE-5A460F8A747A&track_os=ios%25209.3.5&v=1";
   
    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        NSDictionary *dataDic = [dic objectForKey:@"data"];
//        轮播图
        NSMutableArray *sliderArray = [dataDic objectForKey:@"slide"];
        for (NSDictionary *dic in sliderArray) {
            
            [self.sliderArray addObject:[dic objectForKey:@"photo"]];
        }
//        再次传字典
        NSMutableDictionary *comment_entryDic = [dataDic objectForKey:@"comment_entry"];
        self.comment_entryDic = comment_entryDic;
//        entry数组
        NSDictionary *foodDic = [dataDic objectForKey:@"feed"];
        NSMutableArray *entryArray = [foodDic objectForKey:@"entry"];
        for (NSDictionary *dic  in entryArray) {
            YZ_Recommend_Model *model = [[YZ_Recommend_Model alloc] initWithDic:dic];
            [self.recommendArray addObject:model];

        }
        
        
        [self.scrollView setImages:_sliderArray];
      
        [self.myTableView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
    
    

}


-(void)afnHandle{
    
    NSString *string = @"http://open.qyer.com/qyer/home/home_city_info?city_ids=9492%2C31%2C68%2C63&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=38.8827003902727&lng=121.5392975581395&page=1&track_app_channel=App%2520Store&track_app_version=7.0.1&track_device_info=iPad%2520mini%2520%28Wifi%29&track_deviceid=AE6FB093-3107-447D-8CAE-5A460F8A747A&track_os=ios%25209.3.5&v=1";
    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
        
        NSMutableDictionary *bigDic = (NSMutableDictionary *)result;
        NSMutableDictionary *dic = [bigDic objectForKey:@"data"];
        
        self.recommendDic = dic;
        
        NSMutableArray *tabArray = [dic objectForKey:@"tab"];
        self.tabArray = tabArray;
        NSMutableArray *recommend_cityArray = [dic objectForKey:@"recommend_city"];
        self.recommend_cityArray = recommend_cityArray;
        
        
        
//        for (NSDictionary *dic in tabArray) {
//            YZ_Recommend_Model *model = [[YZ_Recommend_Model alloc] initWithDic:dic];
//            [self.tabArray addObject:model];
////            NSLog(@"-----%lu",(unsigned long)_tabArray.count);
//        }
        
        
        
        [self.myTableView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
    
    
}

//第六步实现协议方法

-(void)dosomeThing{
    
    YZ_Visit_ViewController *visitVC = [[YZ_Visit_ViewController alloc] init];
    
    [self.navigationController pushViewController:visitVC animated:YES];
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.myView endEditing:YES];
    
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
