//
//  ZHPopViewController.m
//  GZHProject
//
//  Created by gzh on 2018/2/5.
//  Copyright © 2018年 gzh. All rights reserved.
//

#import "ZHPopViewController.h"
#import "ZHPopView.h"
@interface ZHPopViewController ()

@property (nonatomic, strong) ZHPopView *popview;

@end

@implementation ZHPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *Button = [[UIButton alloc]initWithFrame:CGRectMake(15, 120, 100, 30)];
    Button.backgroundColor = [UIColor redColor];
    [Button setTitle:@"pop" forState:UIControlStateNormal];
    [self.view addSubview:Button];
    
    [[Button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        self.popview.show;
    }];
    
}

- (ZHPopView *)popview{
    if (!_popview) {
    
        _popview =  [[ZHPopView alloc]init];
    }
    return _popview;
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
