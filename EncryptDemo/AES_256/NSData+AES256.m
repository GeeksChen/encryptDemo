//
//  NSData+AES256.m
//  iOS_AES
//
//  Created by Ying on 2018/9/6.
//  Copyright © 2018 cong. All rights reserved.
//

#import "NSData+AES256.h"
#import <CommonCrypto/CommonCryptor.h>

//#define key @"lHJe3W8JePELoWVLjz7mt+tkG/Q58IrXeF/V/DQWlH0="
//#define iv @"1234567890123456"
#define key @"ig+5V8EuJAUwUNtFhAyw6UBvj7V+PC//+C8MGRrMWXs="
#define iv @"P8GmSsx5wlFAKq7ilMqfZQ=="

@implementation NSData (AES256)

- (NSData *) cryptOperation:(CCOperation)operation
{
    NSData *keyData = [[NSData alloc] initWithBase64EncodedString:key options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSData *ivData = [[NSData alloc] initWithBase64EncodedString:iv options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus status = CCCrypt(operation,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding,
                                     [keyData bytes],
                                     kCCKeySizeAES256,
                                     //[iv UTF8String],
                                     [ivData bytes],
                                     [self bytes],
                                     dataLength, 
                                     buffer,
                                     bufferSize,
                                     &numBytesDecrypted);
    if (status == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

- (NSData *)AES256Encrypt
{
    return [self cryptOperation:kCCEncrypt];
}

- (NSData *)AES256Decrypt
{
    return [self cryptOperation:kCCDecrypt];
}



@end
