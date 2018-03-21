//
//  ZHDefine.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#ifndef ZHDefine_h
#define ZHDefine_h


#define WIDTH [[UIScreen mainScreen]bounds].size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

/*
 判读手机型号
 */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 获取一段时间间隔*/
#define ZHStartTime  CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define ZHEndTime    NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

/** 弱引用*/
#define ZHWeakSelf(type)   __weak typeof(type) weak##type = type;


/** 字符串是否为空*/
#define ZHStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
/** 数组是否为空*/
#define ZHArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/** 字典是否为空*/
#define ZHDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/** 是否是空对象*/
#define ZHObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


/**
 根据十六进制色值设置颜色，alpha默认是1.0f
 
 @param hex 十六进制色值
 @return 返回UIColor
 */
#define ZH_HEX_COLOR(hex)           ZH_HEX_COLORVALUES(hex,1.0f)

/**
 根据十六进制色值设置颜色
 
 @param hex 十六进制色值
 @param a alpha通道值
 @return 返回UIColor
 */
#define ZH_HEX_COLORVALUES(hex,a)    ([UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a])


/*
 打印语句  
 */

#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

#define mapAK @"vCOYuo3tVvGhjLBvAIo38WS8jVf4YxiG "


#endif /* ZHDefine_h */
