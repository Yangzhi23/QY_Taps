//
//  YZNetTool.h
//  QY_Tips
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 杨志. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 成功的回调 */
typedef void(^successBlock) (id result);
/** 失败的回调 */
typedef void(^failureBlock) (NSError *error);

/** 枚举 区分不同类型的数据解析 */
typedef NS_ENUM(NSUInteger, YZResponseStyle) {
    YZJSON,
    YZDATA,
    YZXML,
};


/** body  post */
typedef NS_ENUM(NSUInteger, YZRequestStyle) {
    YZBodyString,
    YZBOdyJSON,
    
};



@interface YZNetTool : NSObject


/**  参数 */

/*headers:(NSDictionary *)headers请求头*/

+(void)GET:(NSString *)url body:(id)body headers:(NSDictionary *)headers response:(YZResponseStyle)responseStyle success:(successBlock)success failure:(failureBlock)failure;

/** post请求 */

+(void)POST:(NSString *)url body:(id)body headers:(NSDictionary *)headers bodyStyle:(YZRequestStyle)bodyStyle response:(YZResponseStyle)responseStyle success:(successBlock)success failure:(failureBlock)failure;











@end
