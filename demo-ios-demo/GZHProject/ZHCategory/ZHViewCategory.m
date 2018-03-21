//
//  ZHViewCategory.m
//  GZHProject
//
//  Created by gzh on 17/5/12.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHViewCategory.h"

@implementation UIView(ZHViewCategory)




/**
 *  获取当前View的VC
 *
 *  @return 获取当前View的VC
 */
- (UIViewController *)getCurrentViewController
{
    for (UIView *view = self; view; view = view.superview)
    {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
