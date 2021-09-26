//
//  HMAC.h
//  EncryptDemo
//
//  Created by tend on 2021/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMAC : NSObject

/// 返回结果：32长度  终端命令：echo -n "123" | openssl dgst -md5 -hmac "123"
+ (NSString *)hmacMD5:(NSString *)str withKey:(NSString *)key;

/// 返回结果：40长度   echo -n "123" | openssl sha -sha1 -hmac "123"
+ (NSString *)hmacSHA1:(NSString *)str withKey:(NSString *)key;
+ (NSString *)hmacSHA224:(NSString *)str withKey:(NSString *)key;
+ (NSString *)hmacSHA256:(NSString *)str withKey:(NSString *)key;
+ (NSString *)hmacSHA384:(NSString *)str withKey:(NSString *)key;
+ (NSString *)hmacSHA512:(NSString *)str ithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
