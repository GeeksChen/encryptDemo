//
//  HMAC.m
//  EncryptDemo
//
//  Created by tend on 2021/9/24.
//

#import "HMAC.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation HMAC

/// 返回结果：32长度  终端命令：echo -n "123" | openssl dgst -md5 -hmac "123"
+ (NSString *)hmacMD5:(NSString *)str withKey:(NSString *)key
{
    const char *keyData = key.UTF8String;
    const char *strData = str.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

/// 返回结果：40长度   echo -n "123" | openssl sha -sha1 -hmac "123"
+ (NSString *)hmacSHA1:(NSString *)str withKey:(NSString *)key
{
    NSData *hashData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *digest;
    digest = malloc(CC_SHA1_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA224:(NSString *)str withKey:(NSString *)key
{
    NSData *hashData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *digest;
    digest = malloc(CC_SHA224_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA224, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_SHA224_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA256:(NSString *)str withKey:(NSString *)key
{
    NSData *hashData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *digest;
    digest = malloc(CC_SHA256_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA384:(NSString *)str withKey:(NSString *)key
{
    NSData *hashData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *digest;
    digest = malloc(CC_SHA384_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_SHA384_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA512:(NSString *)str ithKey:(NSString *)key
{
    NSData *hashData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char *digest;
    digest = malloc(CC_SHA512_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA512, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

#pragma mark - Bytes转字符串
/**
 字符大小写可以通过修改“%02X”中的x修改,下面采用的是大写
 */
+ (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02X", bytes[i]];
    }
    
    return [strM copy];
}
@end
