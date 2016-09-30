//
//  YZ_Mall_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/28.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Top_CollectionViewCell.h"
#import "YZ_Mall_ViewController.h"
#import "YZ_Mall_TableVIewCell.h"
#import "YZ_Mall_Model.h"
#import "YZ_Hot_area_Model.h"
#import "YZ_Place_TableViewCell.h"
#import "YZ_Discount_TableviewCell.h"
#import "YZ_Good_CollectionViewCell.h"
#import "YZ_HotList_Model.h"

@interface YZ_Mall_ViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) NSMutableArray *market_topicArray;//第一个分区数组
@property (nonatomic ,strong) NSMutableArray *hot_areaArray;//第二个分区数组
@property (nonatomic, strong) NSMutableArray *discount_topicArray;//第三个分区数组
@property (nonatomic, strong) NSMutableArray *goodArray;//第四个分区

@property (nonatomic, strong) NSArray *collectArray;//头式图图片数组
@property (nonatomic, strong) NSArray *titleArray;//头式图标题数组

@end

@implementation YZ_Mall_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.market_topicArray = [NSMutableArray array];
    self.hot_areaArray = [NSMutableArray array];
    self.discount_topicArray = [NSMutableArray array];
    self.goodArray = [NSMutableArray array];
    [self afnHandle];
    
    self.collectArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg"];
    self.titleArray = @[@"机酒套餐",@"特价机票",@"酒店",@"机票搜索",@"签证",@"当地游",@"门票",@"WiFi电话",@"交通票卷",@"接送包车"];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 100)];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 275)];
    _myView.backgroundColor = [UIColor cyanColor];
    self.myTableView.tableHeaderView = _myView;
    [self.view addSubview:_myTableView];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(65 , 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 5, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collection = [[UICollectionView alloc] initWithFrame:self.myView.bounds collectionViewLayout:flowLayout];
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.myView addSubview:self.collection];
    
    _collection.delegate = self;
    _collection.dataSource = self;
    
//注册collectionview
    [self.collection registerClass:[YZ_Top_CollectionViewCell class] forCellWithReuseIdentifier:@"coCell"];
    
    
   
    [self.myTableView registerClass:[YZ_Mall_TableVIewCell class] forCellReuseIdentifier:@"cell"];
    [self.myTableView registerClass:[YZ_Place_TableViewCell class] forCellReuseIdentifier:@"cellp"];
    [self.myTableView registerClass:[YZ_Discount_TableviewCell class] forCellReuseIdentifier:@"celld"];
    [self.myTableView registerClass:[YZ_Good_CollectionViewCell class] forCellReuseIdentifier:@"cellg"];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }
    if (section == 1) {
        
        return _hot_areaArray.count;
    }
    if (section == 2) {
        
        return _discount_topicArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        YZ_Mall_TableVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        cell.arr = _market_topicArray;
        
        return cell;
    }
    if (indexPath.section == 1) {
        
        YZ_Place_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellp"];
        
        YZ_Hot_area_Model *model = _hot_areaArray[indexPath.row];
        
        cell.areaMocel = model;
        
        return cell;
    }
    if (indexPath.section == 2) {
        
        
        YZ_Discount_TableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celld"];
        
        YZ_Hot_area_Model *model = _discount_topicArray[indexPath.row];
        cell.listModel = model;//传model
        cell.areaMocel = model.topic;//字典
        
        return cell;
    }

    YZ_Good_CollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellg"];
    
    cell.goodArr = _goodArray;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        
        return 120;
    }if (indexPath.section == 1) {
        
        return 380;
    }
    if (indexPath.section == 2) {
        
        return 480;
    }
    
    return 630;
}

//collection的协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YZ_Top_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coCell" forIndexPath:indexPath];
  
    cell.label.text = _titleArray[indexPath.row];
    
    NSString *image = _collectArray[indexPath.row];
    cell.imageV.image = [UIImage imageNamed:image];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}








//使用afn进行网络请求

-(void)afnHandle{
    
    NSString *string = @"http://open.qyer.com/qyer/discount/zk/discount_index?client_id=qyer_android&client_secret=9fcaae8aefc4f9ac4915&v=1&track_deviceid=A1000052A2BCDD&track_app_version=7.0.2&track_app_channel=baidu&track_device_info=PD1524B&track_os=Android5.1&app_installtime=1474192132493";
    
    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
        
        NSDictionary *resultDic = result;
        NSDictionary *dataDic = [resultDic objectForKey:@"data"];
        
        NSMutableArray *market_topicArr = [dataDic objectForKey:@"market_topic"];
        for (NSDictionary *dic in market_topicArr) {
            YZ_Mall_Model *model = [[YZ_Mall_Model alloc] initWithDic:dic];
            [self.market_topicArray addObject:model];
        }
        
        NSMutableArray *hot_areaArr = [dataDic objectForKey:@"hot_area"];
        for (NSDictionary *dic in hot_areaArr) {
            YZ_Hot_area_Model *model = [[YZ_Hot_area_Model alloc] initWithDic:dic];
            [self.hot_areaArray addObject:model];
        }
        
        NSMutableArray *discount_topicArr = [dataDic objectForKey:@"discount_topic"];
        for (NSDictionary *dic in discount_topicArr) {
            YZ_Hot_area_Model *model = [[YZ_Hot_area_Model alloc] initWithDic:dic];
            [self.discount_topicArray addObject:model];
        }
        NSMutableArray *hot_goodsArr = [dataDic objectForKey:@"hot_goods"];
        for (NSDictionary *dic in hot_goodsArr) {
            YZ_HotList_Model *model = [[YZ_HotList_Model alloc] initWithDic:dic];
            [self.goodArray addObject:model];
        }
//        NSLog(@"kk%ld",self.goodArray.count);
//
        [self.myTableView reloadData];
        
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
