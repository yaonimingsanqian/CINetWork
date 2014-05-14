//
//  NSString+RC4.h
//  changjianghui
//
//  Created by OO on 14-3-12.
//  Copyright (c) 2014年 guo song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RC4)
-(NSString *)rc4WithKey:(NSString*)key;
-(NSString*)rc4AndBase64WithKey:(NSString*)key;
@end
