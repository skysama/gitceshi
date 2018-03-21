//
//  ZHPopView.m
//  GZHProject
//
//  Created by gzh on 2018/2/5.
//  Copyright © 2018年 gzh. All rights reserved.
//

#import "ZHPopView.h"
#define ScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define BlueColor [UIColor colorWithRed:50.0/255.0 green:162.0/255.0 blue:248.0/255.0 alpha:1.0]
#define GrayColor [UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0]
@interface ZHPopView()

@property (nonatomic, strong) UIView *backView;
@end
@implementation ZHPopView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        self.frame = CGRectMake(0, ScreenHeight,ScreenWidth , 350);
        [window addSubview:self.backView];
        [window addSubview:self];
    }
    return self;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        _backView.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
        [_backView addGestureRecognizer:tap];
        
    }
    return _backView;
    
}

- (void)show{
    [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backView.hidden = NO;
        
        CGRect newFrame = self.frame;
        newFrame.origin.y = ScreenHeight - self.frame.size.height;
        self.frame = newFrame;
    } completion:nil];
}
- (void)hide{
    [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:0 animations:^{
        self.backView.hidden = YES;
        
        CGRect newFrame = self.frame;
        newFrame.origin.y = ScreenHeight;
        self.frame = newFrame;
    } completion:nil];
}

@end
