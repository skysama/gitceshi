//
//  OneViewController.m
//  GZHProject
//
//  Created by gzh on 17/3/3.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "OneViewController.h"
#import "DetaillVC.h"

@interface OneViewController ()<UIAlertViewDelegate>

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor yellowColor];
    
#pragma target-action  RAC对事件的监听
    UITextField *textfiled =[[UITextField alloc]initWithFrame:CGRectMake(10, 70, 120, 30)];
    textfiled.backgroundColor =[UIColor greenColor];
    textfiled.placeholder = @"监听textfiled的变化";
    [self.view addSubview:textfiled];
    //（1）对事件的监听
 
    RACChannelTo(self,textmodel) = textfiled.rac_newTextChannel;
//    [[textfiled rac_signalForControlEvents:UIControlEventEditingChanged]subscribeNext:^(id x) {
//        NSLog(@"change");
//        self.textmodel = x;
//       NSLog(@"%@--%@",x, self.textmodel);
//    }];
    [[textfiled rac_newTextChannel]subscribeNext:^(id x) {
        
        self.textmodel = x;
        NSLog(@"%@__%@",self.textmodel,x);
    }];
    
    
//    监text的长度变化
    //（2）监听字体的改变
//    [[textfiled rac_textSignal]subscribeNext:^(id x) {
//        NSLog(@"--%@",x);
//    }];
    
    [[[[textfiled rac_textSignal]map:^id(NSString *text) {
    
//        map 是映射的意思 把值映射成别的值 textfiled.text 映射成别的值
        return @(text.length);
//        filter 代表是一个事件
    }]filter:^BOOL(NSNumber *value) {
        
        return  value.integerValue >3;
    }]subscribeNext:^(id x) {
        NSLog(@"----%@",x);
    }];
    
    
#pragma mark 监听代理
    //（3） 代理 用RAC写代理是有局限的，它只能实现返回值为void的代理方法
    UIButton *button =[[UIButton alloc]initWithFrame:CGRectMake(150, 70, 150, 30)];
    button.backgroundColor =[UIColor redColor];
    [button setTitle:@"button的点击跳转" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    __weak typeof(self) WeakSelf=self;
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        DetaillVC *VC =[[DetaillVC alloc]init];
        VC.delegateSignal = [RACSubject subject];
        [VC.delegateSignal  subscribeNext:^(id x) {
           
            [button setTitle:x forState:UIControlStateNormal];
        }];
        
        [WeakSelf.navigationController pushViewController:VC animated:YES];

        
//        [WeakSelf showAlert];
      
           }];
#pragma mark 通知 通知中不需要加remove observe rac中设置了
    
      
    //在接受的页面增加观察者 接受数组
    
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:@"postData" object:nil]subscribeNext:^( NSNotification *notifacation) {
        NSLog(@"%@",notifacation.name);
        NSLog(@"%@",notifacation.object);
        
    }];

    
    
#pragma mark KVO
    //KVO  RACObserve TARGET KEYPATH target是监听目标 KeyPath 是观察的属性值
    UIScrollView *scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 200 ,WIDTH, HEIGHT-200)];
    scrollView.backgroundColor =[UIColor redColor];
    scrollView.contentSize = CGSizeMake(WIDTH, 800);
    [self.view addSubview: scrollView];
    
    [RACObserve(scrollView, contentOffset)subscribeNext:^(id x) {
        //监听scrollview的滑动
        NSLog(@"success");
    }];
    
}


-(void)showAlert{
    UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"RAC" message:@"RACtex" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"11", nil];
    
    //@selector 是监听的方法 RACTuple 是集合类 监听点击方法
    
    typeof(self) WeakSelf =self;
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)]subscribeNext:^(RACTuple *tuple) {
        NSLog(@"%@",tuple.first);
        NSLog(@"%@",tuple.second);
        NSLog(@"%@",tuple.third);
        
      
        
        
    }];
    
    [alertView show];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
