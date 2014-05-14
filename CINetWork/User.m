//
//  User.m
//  CINetWork
//
//  Created by zhao on 14-5-14.
//  Copyright (c) 2014年 zhao. All rights reserved.
//

#import "User.h"
#import "AFAppDotNetAPIClient.h"

@implementation User

+ (NSURLSessionDataTask*)login:(NSString *)acc :(NSString *)pass :(void (^)(NSError *, NSDictionary *))block
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:@"0" forKey:@"lastInvokeTime4Friend"];
    [parameters setObject:@"0" forKey:@"lastInvokeTime4Event"];
    [parameters setObject:@"0" forKey:@"lastInvokeTime4Column"];
    [parameters setObject:@"0" forKey:@"lastInvokeTime4Group"];
    [parameters setObject:acc forKey:@"username"];
    [parameters setObject:pass forKey:@"password"];
    [parameters setObject:@"webSite" forKey:@"platform"];
    [parameters setObject:@"json" forKey:@"app"];
    [parameters setObject:@"user" forKey:@"mod"];
    [parameters setObject:@"login" forKey:@"act"];
    
    return [[AFAppDotNetAPIClient sharedClient] POST:nil parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (block) {
            block(nil,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(error,nil);
        }
    }];

}
@end
