//
//  MU_VerifyCodeBtn.m
//  MUMULive
//
//  Created by gzh on 17/4/13.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "MU_VerifyCodeBtn.h"

@interface MU_VerifyCodeBtn ()
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)NSInteger count;

@end
@implementation MU_VerifyCodeBtn

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup ];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.backgroundColor =[UIColor yellowColor];
    self.layer.cornerRadius =6;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
-(void)timeFailBeginFrom:(NSInteger)timeCount{
    self.count = timeCount;
    self.enabled =NO;
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
- (void)timerFired {
    if (self.count != 1) {
        self.count -= 1;
        self.enabled = NO;
        [self setTitle:[NSString stringWithFormat:@"%lds", self.count] forState:UIControlStateNormal];
        //      [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count] forState:UIControlStateDisabled];
        [self setBackgroundColor:[UIColor greenColor]];
        self.enabled =NO;
    } else {
        
        self.enabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        //        self.count = 60;
        [self setBackgroundColor:[UIColor yellowColor]];
        [self.timer invalidate];
    }
}

@end
