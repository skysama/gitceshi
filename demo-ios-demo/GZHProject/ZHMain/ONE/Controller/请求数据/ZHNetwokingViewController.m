//
//  ZHNetwokingViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/12.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHNetwokingViewController.h"
#import "ZHHttpRequest.h"
@interface ZHNetwokingViewController ()

@end

@implementation ZHNetwokingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *textPostBtn =[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 80, 30)];
    [textPostBtn setTitle:@"Post请求" forState:UIControlStateNormal];
    [textPostBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [textPostBtn setBackgroundColor: [UIColor yellowColor]];
    textPostBtn.clipsToBounds =YES;
    textPostBtn.layer.cornerRadius = 5;
    [self.view addSubview:textPostBtn];
    
    [[textPostBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button ) {
       
//        NSDictionary *dic =@{@"Accept":@"application/json", @"Accept-Encoding":@"gzip"};
//      NSString *URL=  @"http://chanyouji.com/api/users/likes/268717.json";
        
         NSDictionary *dic =@{@"act":@"list",@"type":@"1",@"uid":@"35"};
        NSString *URL = @"http://192.168.2.233/php/api/live.php";
        [ZHHttpRequest  PostWithUrlString:URL  parms:dic finished:^(NSData *requestData) {
            
            
            
        } iscaChe:YES];
        
    }];
    
    UIButton *textGetBtn =[[UIButton alloc]initWithFrame:CGRectMake(250, 200, 80, 30)];
    [textGetBtn setTitle:@"Get请求" forState:UIControlStateNormal];
    [textGetBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [textGetBtn setBackgroundColor: [UIColor yellowColor]];
    textGetBtn.clipsToBounds =YES;
    textGetBtn.layer.cornerRadius = 5;
    [self.view addSubview:textGetBtn];

    [[textGetBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button ) {
        
        [ZHHttpRequest GetWithUrlString:@"https://www.huijiagoo.com/index.php/Api/Api/index" finished:^(NSData *requestData) {
            
        } isCache:YES];
        
        
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
