//
//  SHA.h
//  EncryptDemo
//
//  Created by tend on 2021/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHA : NSObject

+ (NSString *)md5:(NSString *)str;

+ (NSString *)sha1:(NSString *)str;

+ (NSString *)sha256:(NSString *)str;

+ (NSString *)sha512:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
