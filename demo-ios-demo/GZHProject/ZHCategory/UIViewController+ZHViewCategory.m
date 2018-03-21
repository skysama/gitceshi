//
//  UIViewController+ZHViewCategory.m
//  GZHProject
//
//  Created by gzh on 17/3/6.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "UIViewController+ZHViewCategory.h"

@implementation UIViewController (ZHViewCategory)


-(void)viewDidLoad{
    //添加一个类别 统计每个页面的点击效果
 
    NSLog(@"页面统计%@",self);
    
    
    
    
}

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}



@end
