//
//  ZHHttpRequest.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHHttpRequest.h"
#import <YYCache.h>
@implementation ZHHttpRequest

/*
 Post请求
 */
+(void)PostWithUrlString:(NSString *)UrlString parms:(NSDictionary *)dict finished:(DownLoadFinishedBlock)finishedBlock iscaChe:(BOOL)iscaChe{
    
    UrlString = [UrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   
    
    UIApplication *application =[UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
  
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
    session.requestSerializer.timeoutInterval = 10.0f;
 
    //设置缓存
    NSData *cachedata =[NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *cacheString = [[NSString alloc]initWithData:cachedata encoding:NSUTF8StringEncoding];
    
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@",UrlString,cacheString];

    
    YYCache *cache =[[YYCache alloc]initWithName:@"HttpCache"];
    
 id responsecache =[cache objectForKey:cacheKey];
    
    if (iscaChe && responsecache !=nil) {
        finishedBlock(responsecache);
        NSLog(@"缓存--%@",responsecache);
    }
   
    
    [session POST:UrlString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishedBlock(responseObject);
        
        [cache setObject:responseObject forKey:cacheKey];
        NSLog(@"response%@",responseObject);
        application.networkActivityIndicatorVisible = NO;
       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error%@",error);
        application.networkActivityIndicatorVisible = NO;

    }];
    
     
    
}
/*
 Get请求
 */
+(void)GetWithUrlString:(NSString *)UrlString finished:(DownLoadFinishedBlock)finishedBlock isCache:(BOOL)isCache{
    UrlString = [UrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    UIApplication *application =[UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    session.requestSerializer.timeoutInterval = 10.0f;
    
    //设置缓存
    
    NSString *cachekey  =[NSString stringWithFormat:@"%@",UrlString];
    
    YYCache *cache =[[YYCache alloc]initWithName:@"HttpCache"];
    
    id responsecache =[cache objectForKey:cachekey];
    
    if (isCache && responsecache !=nil) {
        finishedBlock(responsecache);
    }

    [session GET:UrlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        finishedBlock(responseObject);
        
        [cache setObject:responseObject forKey:cachekey];
        NSLog(@"%@",responseObject);
        application.networkActivityIndicatorVisible = NO;

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error%@",error);
        application.networkActivityIndicatorVisible = NO;

    }];
    
    
}



@end
