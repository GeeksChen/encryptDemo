//
//  AES128.h
//  EncryptDemo
//
//  Created by tend on 2021/9/24.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"

NS_ASSUME_NONNULL_BEGIN

@interface AES128 : NSObject

+ (NSString*) AES128Encrypt:(NSString *)plainText key:(NSString*)key;

+ (NSString*) AES128Decrypt:(NSString *)encryptText key:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
