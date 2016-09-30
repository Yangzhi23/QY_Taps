//
//  YZ_Destination_ViewController.m
//  QY_Tips
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZ_Destination_ViewController.h"
#import "YZNetTool.h"
#import "YZ_ hot_country_TableViewCell.h"
#import "YZ_ Country_TableviewCell.h"
#import "YZ_ Continent_Model.h"
#import "YZ_City_ViewController.h"
@interface YZ_Destination_ViewController ()<UITableViewDataSource,UITableViewDelegate,doIt>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIButton *asiaButton;//亚洲
@property (nonatomic, strong) UIButton *europeButton;//欧洲
@property (nonatomic, strong) UIButton *africaButton;//非洲
@property (nonatomic, strong) UIButton *northButton;//北美洲
@property (nonatomic, strong) UIButton *southButton;//南美洲
@property (nonatomic, strong) UIButton *oceaniaButton;//大洋洲
@property (nonatomic, strong) UIButton *antarcticaButton;//南极洲

@property (nonatomic, strong) NSMutableArray *continentArray;
@property (nonatomic, assign) NSInteger tagNum;

@end

@implementation YZ_Destination_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.continentArray = [NSMutableArray array];
    [self afnHandle];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 40)];
    [self.view addSubview:self.myTableView];
   
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 240)];
    _myView.backgroundColor = [UIColor yellowColor];
    _myTableView.tableHeaderView = self.myView;
    
    [self createButton];
    
//    注册
    [self.myTableView registerClass:[YZ__hot_country_TableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    [self.myTableView registerClass:[YZ__Country_TableviewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)createButton{
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"地图.jpg"]];
    imageV.frame = self.myView.bounds;
    imageV.backgroundColor = [UIColor magentaColor];
    imageV.userInteractionEnabled = YES;
    [self.myView addSubview:imageV];

//  创建七大洲
//    亚洲
    self.asiaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _asiaButton.backgroundColor = [UIColor grayColor];
    _asiaButton.frame = CGRectMake(imageV.frame.size.width - 120, imageV.frame.origin.y + 25, imageV.frame.size.width / 7,imageV.frame.size.height / 5);
    [imageV addSubview:_asiaButton];
    [self.asiaButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _asiaButton.tag = 1001;

//    欧洲
    self.europeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.europeButton.backgroundColor = [UIColor grayColor];
    _europeButton.frame = CGRectMake(imageV.frame.size.width / 2 - 60 + 10, imageV.frame.origin.y + 20, imageV.frame.size.width / 7, imageV.frame.size.height / 5);
    [imageV addSubview:self.europeButton];
    [self.europeButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _europeButton.tag = 1002;
    
//    非洲
    self.africaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.africaButton.backgroundColor = [UIColor grayColor];
    _africaButton.frame = CGRectMake(imageV.frame.size.width / 2, imageV.frame.size.height / 2 - 15, 45, 45);
    [imageV addSubview:self.africaButton];
    [self.africaButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _africaButton.tag = 1003;
    
//    北美洲
    self.northButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.northButton.backgroundColor = [UIColor grayColor];
    _northButton.frame = CGRectMake(imageV.frame.origin.x + 50, imageV.frame.origin.y + 30, imageV.frame.size.width / 7 + 10, imageV.frame.size.height / 5);
    [imageV addSubview:self.northButton];
    [self.northButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _northButton.tag = 1004;
    
//    南美洲
    self.southButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.southButton.backgroundColor = [UIColor grayColor];
    _southButton.frame = CGRectMake(imageV.frame.size.width / 3 - 10, imageV.frame.size.height / 2, 60, 50);
    [imageV addSubview:self.southButton];
    [self.southButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _southButton.tag = 1005;
    
//    大洋洲
    self.oceaniaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.oceaniaButton.backgroundColor = [UIColor grayColor];
    self.oceaniaButton.frame = CGRectMake(imageV.frame.size.width - 120, imageV.frame.size.height / 2 - 20, 60, 50);
    [imageV addSubview:self.oceaniaButton];
    [self.oceaniaButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _oceaniaButton.tag = 1006;
    
//    南极洲
    self.antarcticaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.antarcticaButton.backgroundColor = [UIColor grayColor];
    _antarcticaButton.frame = CGRectMake(_africaButton.frame.origin.x + _africaButton.frame.size.width , _africaButton.frame.origin.y + _africaButton.frame.size.height + 15, 60, 50);
    [imageV addSubview:self.antarcticaButton];
    [self.antarcticaButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _antarcticaButton.tag = 1007;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 1;
    }
    if (_continentArray.count != 0) {

        YZ__Continent_Model *model = _continentArray[self.tagNum];

        return model.country.count;

    }
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
  
        if (_continentArray.count != 0) {
            
            YZ__hot_country_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            
            YZ__Continent_Model *model = _continentArray[self.tagNum];
        
            cell.hot_countryModel = model;
            
//            成为代理人
            cell.myDelegate = self;
            
            return cell;
        }
    }
    
    YZ__Country_TableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (_continentArray.count != 0) {
        
        YZ__Continent_Model *model = _continentArray[self.tagNum];
        
        cell.countryMocel = model.country[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 1000 - 60;
    }
    
    return 100;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return @"第一个分区标题";
    }
    
    return @"第二个分区标题";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 50;
    }

    return 70;
}

//进行afn网络请求

-(void)afnHandle{
    
    NSString *string = @"http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=47.498405&lon=19.040758&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone8%2C1&track_deviceid=37F591C4-33ED-40E8-BB2F-BA7783ECF108&track_os=ios%25209.3.1&v=1";

    [YZNetTool GET:string body:nil headers:nil response:YZJSON success:^(id result) {
       
        NSDictionary *dataDic = result;
       
        NSMutableArray *dataArray = dataDic[@"data"];

        for (NSDictionary *dic in dataArray) {
            
            YZ__Continent_Model *model = [[YZ__Continent_Model alloc] initWithDic:dic];
            [self.continentArray addObject:model];
            
        }
        
        YZ__Continent_Model *modelAsia = _continentArray[0];
        [_asiaButton setTitle:modelAsia.cnname forState:UIControlStateNormal];
        
        YZ__Continent_Model *modelEur = _continentArray[1];
        [_europeButton setTitle:modelEur.cnname forState:UIControlStateNormal];
        
        YZ__Continent_Model *modelNorth = _continentArray[2];
        [_northButton setTitle:modelNorth.cnname forState:UIControlStateNormal];

        YZ__Continent_Model *modelSouth = _continentArray[3];
        [_southButton setTitle:modelSouth.cnname forState:UIControlStateNormal];
        
        YZ__Continent_Model *modelOceania = _continentArray[4];
        [_oceaniaButton setTitle:modelOceania.cnname forState:UIControlStateNormal];
        
        YZ__Continent_Model *modelAfrica = _continentArray[5];
        [_africaButton setTitle:modelAfrica.cnname forState:UIControlStateNormal];
        
        YZ__Continent_Model *modelAntarctica = _continentArray[6];
        [_antarcticaButton setTitle:modelAntarctica.cnname forState:UIControlStateNormal];
        
        //    *****给button一个初始值,还需要进行一步判断*****
        if (self.continentArray.count != 0) {
            self.tagNum = 0;
//            [self.myTableView reloadData];//刷新
        }

        
        
        [self.myTableView reloadData];
        
    } failure:^(NSError *error) {
        
    
        
    }];
    
    
    
    
}


//返回的是view (能带图片的)
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 50)];
    view.backgroundColor  =[UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 140, 40)];
    label.text = @"亚洲以及其他地区";
    label.backgroundColor = [UIColor magentaColor];
    [view addSubview:label];
    
    return view;
}


-(void)setTagNum:(NSInteger)tagNum{
    
    _tagNum = tagNum;
    
    [self.myTableView reloadData];
    
}

//七大洲的点击方法

-(void)buttonAction:(UIButton *)button{
    
    [self.myTableView reloadData];
    
    self.tagNum = button.tag - 1001;
}


//协议的实现

-(void)doSomething{

    YZ_City_ViewController *cityVC = [[YZ_City_ViewController alloc] init];

    [self.navigationController pushViewController:cityVC animated:YES];
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
