//
//  DetaillVC.h
//  GZHProject
//
//  Created by gzh on 17/3/4.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectBlock)(NSInteger num);
@interface DetaillVC : ZHBaseViewController

@property(nonatomic,copy)selectBlock selectblock;

@property (nonatomic, strong)RACSubject *delegateSignal;

//RACSignal 信号类
@property (nonatomic, strong) RACSignal *TextSignal;


@end
