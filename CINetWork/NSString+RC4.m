//
//  NSString+RC4.m
//  changjianghui
//
//  Created by OO on 14-3-12.
//  Copyright (c) 2014年 guo song. All rights reserved.
//

#import "NSString+RC4.h"
#import "NSData+Base64.h"
@implementation NSString (RC4)
-(NSString *)rc4WithKey:(NSString*)key
{
    int j = 0;
    unichar res[self.length];
    const unichar* buffer = res;
    unsigned char s[256];
    for (int i = 0; i < 256; i++)
    {
        s[i] = i;
    }
    for (int i = 0; i < 256; i++)
    {
        j = (j + s[i] + [key characterAtIndex:(i % key.length)]) % 256;
        unsigned char tmp = s[i];
        s[i] = s[j];
        s[j] = tmp;
    }
    int i = j = 0;
    for (int z = 0; z < self.length; z++)
    {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        unsigned char tmp = s[i];
        s[i] = s[j];
        s[j] = tmp;
        
        unsigned char f = [self characterAtIndex:z] ^ s[ (s[i] + s[j]) % 256];
        res[z] = f;
    }
    NSString *retStr=[NSString stringWithCharacters:buffer length:self.length];
    return retStr;
//    NSMutableArray *iS = [[NSMutableArray alloc] initWithCapacity:256];
//    NSMutableArray *iK = [[NSMutableArray alloc] initWithCapacity:256];
//    
//    for (int i= 0; i<256; i++) {
//        [iS addObject:[NSNumber numberWithInt:i]];
//    }
//    
//    int j=1;
//    
//    for (short i=0; i<256; i++) {
//        
//        UniChar c = [key characterAtIndex:i%key.length];
//        
//        [iK addObject:[NSNumber numberWithChar:c]];
//    }
//    
//    j=0;
//    
//    for (int i=0; i<255; i++) {
//        int is = [[iS objectAtIndex:i] intValue];
//        UniChar ik = (UniChar)[[iK objectAtIndex:i] charValue];
//        
//        j = (j + is + ik)%256;
//        NSNumber *temp = [iS objectAtIndex:i];
//        [iS replaceObjectAtIndex:i withObject:[iS objectAtIndex:j]];
//        [iS replaceObjectAtIndex:j withObject:temp];
//        
//    }
//    
//    int i=0;
//    j=0;
//    
//    NSString *result = [[NSString alloc]initWithString: self];
//    
//    for (short x=0; x<[self length]; x++) {
//        i = (i+1)%256;
//        
//        int is = [[iS objectAtIndex:i] intValue];
//        j = (j+is)%256;
//        
//        int is_i = [[iS objectAtIndex:i] intValue];
//        int is_j = [[iS objectAtIndex:j] intValue];
//        
//        int t = (is_i+is_j) % 256;
//        int iY = [[iS objectAtIndex:t] intValue];
//        
//        UniChar ch = (UniChar)[self characterAtIndex:x];
//        UniChar ch_y = ch^iY;
//        
//        result = [result stringByReplacingCharactersInRange:NSMakeRange(x, 1) withString:[NSString stringWithCharacters:&ch_y length:1]];
//    }
//    
//    
//    return result;

}
-(NSString*)rc4AndBase64WithKey:(NSString*)key{
    NSString *retStr=[self rc4WithKey:key];
    NSData *strData=[retStr dataUsingEncoding:NSUTF8StringEncoding];
    retStr=[strData base64Encoding];
    return retStr;
}
@end
