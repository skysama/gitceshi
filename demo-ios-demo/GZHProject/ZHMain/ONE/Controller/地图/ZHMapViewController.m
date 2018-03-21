//
//  ZHMapViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/15.
//  Copyright © 2017年 gzh. All rights reserved.
/*
 注：自iOS8起，系统定位功能进行了升级，SDK为了实现最新的适配，自v2.5.0起也做了相应的修改，开发者在使用定位功能之前，需要在info.plist里添加（以下二选一，两个都添加默认使用NSLocationWhenInUseUsageDescription）：
 
 NSLocationWhenInUseUsageDescription ，允许在前台使用时获取GPS的描述
 
 NSLocationAlwaysUsageDescription ，允许永久使用GPS的描述
 */

#import "ZHMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//mapview
#import  <BaiduMapAPI_Location/BMKLocationService.h>//定位服务
#import  <BaiduMapAPI_Search/BMKGeocodeSearchOption.h>//检索类
@interface ZHMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>{
    BMKMapView *_mapview;
    BMKLocationService *_locationService;
}

@end

@implementation ZHMapViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _mapview.delegate = self;
}
-(void)viewDidDisappear:(BOOL)animated{
    _mapview.delegate =nil;
    //停止定位
    [_locationService stopUserLocationService];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapview =[[BMKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_mapview];
    //设置地图样式为普通地图
    _mapview.mapType = BMKMapTypeStandard;
    _mapview.showsUserLocation = YES;
    //设置定位样式
    _mapview.userTrackingMode =BMKUserTrackingModeFollow;
    _mapview.showsUserLocation = YES;//显示我的位置
    _mapview.zoomLevel = 15;//地图显示比例
    _mapview.rotateEnabled =YES;//设置是否可以旋转
    
//    _mapview.centerCoordinate = (CLLocationCoordinate2D){,};
    
    
    
    
}
//定位服务
-(void)startlocation{
    _locationService = [[BMKLocationService alloc]init];
    _locationService.delegate = self;
    //定位最下距离
    _locationService.distanceFilter = kCLHeadingFilterNone;
    [_locationService startUserLocationService];
    
}
#pragma mark BMKLocationServiceDelegate 定位的代理方法
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    
    NSLog(@"%@",userLocation.title);
    [_mapview updateLocationData:userLocation];
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
