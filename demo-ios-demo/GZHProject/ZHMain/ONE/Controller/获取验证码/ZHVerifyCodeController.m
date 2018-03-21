//
//  ZHVerifyCodeController.m
//  GZHProject
//
//  Created by gzh on 17/5/15.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHVerifyCodeController.h"
#import "MU_VerifyCodeBtn.h"
@interface ZHVerifyCodeController ()

@end

@implementation ZHVerifyCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获取短信验证码";
    // Do any additional setup after loading the view.
    MU_VerifyCodeBtn *VerifyBtn =[[MU_VerifyCodeBtn alloc]initWithFrame:CGRectMake(100, 200, 80, 30)];
    [VerifyBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    [VerifyBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [VerifyBtn setBackgroundColor: [UIColor yellowColor]];
    VerifyBtn.clipsToBounds =YES;
    VerifyBtn.layer.cornerRadius = 5;
       [self.view addSubview:VerifyBtn];
  
    [[VerifyBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id  button) {
        
        [button  timeFailBeginFrom:10];
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
