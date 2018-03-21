//
//  ZHBaseViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/12.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHBaseViewController.h"

@interface ZHBaseViewController ()

@end

@implementation ZHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor whiteColor];
    //       [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //整个头背景颜色 黄
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    //返回按钮颜色
    [self.navigationController.navigationBar setTintColor:[UIColor yellowColor]];
    //头上面文字颜色字号  19号
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f],NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    //        self.navigationController.navigationBar.backItem.backBarButtonItem.image=[UIImage imageNamed:@"wodezuopin_fanhui"];
    //返回按钮
    
    UIButton * BackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    BackButton.frame = CGRectMake(18, 10, 20,20);
    [ BackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BackButton setImage:[UIImage imageNamed:@"wodezuopin_fanhui"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:BackButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    self.view.backgroundColor =[UIColor whiteColor];
    

//      [self.navigationBar setBackgroundImage:[UIImage createImageWithColor:RGB_COLOR(246, 246, 246)] forBarMetrics:UIBarMetricsDefault];
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
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
