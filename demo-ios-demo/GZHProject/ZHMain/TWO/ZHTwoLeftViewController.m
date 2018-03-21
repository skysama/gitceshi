//
//  ZHTwoLeftViewController.m
//  GZHProject
//
//  Created by gzh on 2017/12/28.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHTwoLeftViewController.h"
#import "ThiredVC.h"
@interface ZHTwoLeftViewController ()

@end

@implementation ZHTwoLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(150, 70, 150, 30)];
    button.backgroundColor =[UIColor redColor];
    [button setTitle:@"button的点击跳转" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        ThiredVC *VC  = [[ThiredVC alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
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
