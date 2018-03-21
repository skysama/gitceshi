//
//  ZHPayViewController.m
//  GZHProject
//
//  Created by gzh on 2017/12/20.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHPayViewController.h"
#import "PaymentView.h"
//#import <QuartzCore/QuartzCore.h>
@interface ZHPayViewController ()
@property (nonatomic, strong) PaymentView *payView;
@end

@implementation ZHPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     
    
    UIButton *PayBtn =[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 80, 30)];
    [PayBtn setTitle:@"支付" forState:UIControlStateNormal];
    [PayBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [PayBtn setBackgroundColor: [UIColor yellowColor]];
    PayBtn.clipsToBounds =YES;
    PayBtn.layer.cornerRadius = 5;
    [self.view addSubview:PayBtn];
    [[PayBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self clickpayview];
    }];
    
    UIImageView *View  = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 80, 80)];
    View.backgroundColor = [UIColor redColor];
//    阴影圆角
    View.layer.shadowRadius = 5;
    View.layer.shadowOpacity =0.5f;
//    阴影偏移量
    View.layer.shadowOffset = CGSizeMake(4, 2);
    
    View.layer.shadowColor = [UIColor blueColor].CGColor;
    [self.view addSubview:View];
}

- (void)clickpayview{
     [self.payView show];
    [self.payView reloadPaymentView];
//    支付完成
    self.payView.completeHandle = ^(NSString *inputPwd, NSString *paytool) {
        NSLog(@"支付完成%@--%@",inputPwd,paytool);
    };
  
}

- (PaymentView *)payView{
    if (!_payView) {
        _payView = [[PaymentView alloc]init];
        _payView.title = @"付款详情";
        _payView.payType = PaymentTypeCard;
        _payView.alertType = PayAlertTypeSheet;
        _payView.translateType = PayTranslateTypeSlide;
        _payView.payDescrip = @"李白";
        _payView.payTool = @"余额";
        _payView.payAmount = 100.00;
        _payView.pwdCount = 6;
        
        
    }
    return _payView;
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
