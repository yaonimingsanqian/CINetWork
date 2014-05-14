//
//  User.h
//  CINetWork
//
//  Created by zhao on 14-5-14.
//  Copyright (c) 2014年 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+(NSURLSessionDataTask*)login :(NSString*)pass :(NSString*)acc :(void(^)(NSError *error,NSDictionary *dic))complete;
@end
