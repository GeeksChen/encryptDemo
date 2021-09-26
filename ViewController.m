//
//  ViewController.m
//  EncryptDemo
//
//  Created by tend on 2021/9/24.
//

#import "ViewController.h"
#import "AES256.h"
#import "AES128.h"
#import "RSA.h"
#import "HMAC.h"
#import "SHA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testHMAC];
//    [self testRSA];
//    [self testSHA];
//    [self testAES128];
    [self testAES256];
    
}

- (void)testHMAC {
    
    NSString *str = @"hello world";
    NSString *key = @"123456";
    
    NSString *hmacMD5Str = [HMAC hmacMD5:str withKey:key];
    NSString *hmacSHA1Str = [HMAC hmacSHA1:str withKey:key];
    NSString *hmacSHA224Str = [HMAC hmacSHA224:str withKey:key];
    NSString *hmacSHA256Str = [HMAC hmacSHA256:str withKey:key];
    NSString *hmacSHA384Str = [HMAC hmacSHA384:str withKey:key];
    NSString *hmacSHA512Str = [HMAC hmacSHA512:str ithKey:key];

    NSLog(@"str:%@",str);
    NSLog(@"hmacMD5Str:%@",hmacMD5Str);
    NSLog(@"hmacSHA1Str:%@",hmacSHA1Str);
    NSLog(@"hmacSHA224Str:%@",hmacSHA224Str);
    NSLog(@"hmacSHA256Str:%@",hmacSHA256Str);
    NSLog(@"hmacSHA384Str:%@",hmacSHA384Str);
    NSLog(@"hmacSHA512Str:%@",hmacSHA512Str);
}


- (void)testSHA {
        
    
    NSString *str = @"hello world";

    NSString *md5Str = [SHA md5:str];
    
    NSString *sha1Str = [SHA sha1:str];
    
    NSString *sha256Str = [SHA sha256:str];
    
    NSString *sha512Str = [SHA sha512:str];
    
    NSLog(@"str:%@",str);
    NSLog(@"md5Str:%@",md5Str);
    NSLog(@"sha1Str:%@",sha1Str);
    NSLog(@"sha256Str:%@",sha256Str);
    NSLog(@"sha512Str:%@",sha512Str);
}

- (void)testRSA {
    
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";

    NSString *originString = @"hello world!";
   
    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    NSString *encWithPrivKey;
    NSString *decWithPublicKey;
    
    NSLog(@"Original string(%d): %@", (int)originString.length, originString);
    
    // Demo: encrypt with public key
    encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
    NSLog(@"Enctypted with public key: %@", encWithPubKey);
    // Demo: decrypt with private key
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
 
    // Demo: encrypt with private key
    encWithPrivKey = [RSA encryptString:originString privateKey:privkey];
    NSLog(@"Enctypted with private key: %@", encWithPrivKey);

    // Demo: decrypt with public key
    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:pubkey];
    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
}

- (void)testAES128 {
    
    NSString *encryptStr = [AES128 AES128Encrypt:@"123456" key:@"111"];
    NSLog(@"加密：%@",encryptStr);
    
    NSString *decryptStr = [AES128 AES128Decrypt:encryptStr key:@"111"];
    NSLog(@"解密：%@",decryptStr);
}

- (void)testAES256 {

    NSString *encryptStr = [AES256 encrypt:@"123456"];
    NSLog(@"加密: %@", encryptStr);
    
    NSString *decryptStr = [AES256 decrypt:encryptStr];
    NSLog(@"解密: %@" ,decryptStr);
}

@end
