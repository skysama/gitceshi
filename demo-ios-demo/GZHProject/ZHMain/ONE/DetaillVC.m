//
//  DetaillVC.m
//  GZHProject
//
//  Created by gzh on 17/3/4.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "DetaillVC.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface DetaillVC ()

@end

@implementation DetaillVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button  =[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 80, 30)];
    [button setTitle:@"通知btn" forState:UIControlStateNormal];
    button.backgroundColor =[UIColor redColor];
    [self.view addSubview:button];
  
     [[button  rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
         
         NSMutableArray *dataArray =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
         //创建一个通知 观察者是dataArray
         [[NSNotificationCenter defaultCenter ]postNotificationName:@"postData" object:dataArray userInfo:nil];
     }];
    
    UIButton *newbtn =[[UIButton alloc]initWithFrame:CGRectMake(200, 150, 80, 50)];
    [newbtn setTitle:@"代理返回btn" forState:UIControlStateNormal];
    newbtn.backgroundColor =[UIColor greenColor];
    [self.view addSubview:newbtn];
    
    
    __weak typeof(self) weakself = self;
    [[newbtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
        if (weakself.delegateSignal) {
            [weakself.delegateSignal sendNext:@"代理传值101"];
        }
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
#pragma mark RACSignal
//    将来有数据传递 只要数据改变 信号内部接受数据 就会马上发出数据 是发出数据 不是信号类发出。
//    RACSignal  信号类 RACDisposable取消订阅 RACSubscriber发送数据
//    1 创建
    _TextSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
//       3 发送信号
        [subscriber sendNext:@1];
//        5 不再发送数据 返回发送完成
        [subscriber sendCompleted];
        
//        6 订阅信号被取消 用户取消 清空一些资源
        return [RACDisposable disposableWithBlock:^{
            
            NSLog(@"取消订阅 ");
        }];
        
        
    }];
//    2 订阅信号 只要订阅信号就返回一个订阅者   subscribeNext创建订阅者把数据保存在订阅者里
    [_TextSignal subscribeNext:^(id x) {
//        4  接受block数据
        NSLog(@"%@",x);
    }];
#pragma RACSubject
//    自己充当信号 又可以发送信号  可以替换代理
//  1  创建信号
    RACSubject *subject  =  [RACSubject subject];
    
//    2 订阅信号  subscribeNext把订阅这保存起来
    [subject subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
//    3 发送信号
    [subject sendNext:@1];
    
//    RACReplaySubject  设置缓存  重复提供信号类
  
#pragma    RACTuple 元组
    NSDictionary *dic = @{@"name": @"libai",@"age":@18};
    [dic.rac_sequence.signal subscribeNext:^(RACTuple *x) {
//        专门用来解析元组
        RACTupleUnpack(NSString *key, NSString *value) = x;
        
        NSLog(@"%@-%@",key, value);
        
    }];
    
 #pragma    RACSequence  集合类 代替NSArray NSDictionary  快速便利数组和字典
    NSArray *arr  =@[@1,@2,@3];
    
    [arr.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
//    字典转模型
    
//    map:映射的意思，目的：把原始值value映射成一个新值
//    NSArray *newFlags = [[dictArr.rac_sequence map:^id(id value) {
//        return [FlagItem flagWithDict:value];
//    }] array];
#pragma map +switchToLatest
//         switchToLatest  自动切换到最后一个信号
    
    
    
#pragma takeUntil 用于cell上的button的点击
    
    
}



//- (RACSignal *)TextSignal{
//    if (!_TextSignal) {
//      _TextSignal =
//    }
//    return _TextSignal;
//}

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
