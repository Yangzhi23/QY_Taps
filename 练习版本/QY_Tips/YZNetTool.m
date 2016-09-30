//
//  YZNetTool.m
//  QY_Tips
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import "YZNetTool.h"

#import <AFNetworking.h>

#import <UIImageView+AFNetworking.h>

@implementation YZNetTool

+(void)GET:(NSString *)url body:(id)body headers:(NSDictionary *)headers response:(YZResponseStyle)responseStyle success:(successBlock)success failure:(failureBlock)failure{
    
    // 1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.设置请求头
    
    if (headers) {
        for (NSString *key in headers.allKeys) {
            [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    // 3.设置返回数据的类型
    
    /**  对枚举类型进行判断 */
    switch (responseStyle) {
        case YZJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case YZDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case YZXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
            
        default:
            break;
    }
    
    // 4.设置响应数据类型
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    // 5.进行 UTF-8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //6. 使用AFN进行网络请求
    
    
    
    
    [manager GET:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        //不用管  可以直接 nil
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            success(responseObject);
            //            NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
            
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
        
    }];
    
}

+(void)POST:(NSString *)url body:(id)body headers:(NSDictionary *)headers bodyStyle:(YZRequestStyle)bodyStyle response:(YZResponseStyle)responseStyle success:(successBlock)success failure:(failureBlock)failure{
    // 1.设置网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.设置body数据类型
    
    switch (bodyStyle) {
        case YZBOdyJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case YZBodyString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                return parameters;
            }];
        default:
            break;
    }
    
    
    if (headers) {
        for (NSString *key in headers.allKeys) {
            [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    // 3.设置返回数据的类型
    
    /**  对枚举类型进行判断 */
    switch (responseStyle) {
        case YZJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case YZDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        case YZXML:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
            
            
        default:
            break;
    }
    
    // 4.设置响应数据类型
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"image/jpeg", @"text/vnd.wap.wml", nil]];
    // 5.进行 UTF-8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    //6. 使用AFN进行网络请求
    
    
    
    
    [manager POST:url parameters:body progress:^(NSProgress * _Nonnull downloadProgress) {
        //不用管  可以直接 nil
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }
        
    }];
}





@end
