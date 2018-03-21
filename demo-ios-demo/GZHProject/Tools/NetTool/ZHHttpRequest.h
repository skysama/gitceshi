//
//  ZHHttpRequest.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
typedef void (^DownLoadFinishedBlock)(NSData *requestData);
@interface ZHHttpRequest : NSObject

+(void)PostWithUrlString:(NSString*)UrlString parms:(NSDictionary*)dict finished:(DownLoadFinishedBlock)finishedBlock iscaChe:(BOOL)iscaChe;

+(void)GetWithUrlString:(NSString*)UrlString finished:(DownLoadFinishedBlock)finishedBlock isCache:(BOOL)isCache;


@end
