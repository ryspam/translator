//
//  TRGoogleClient.m
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRGoogleClient.h"
#import "JSONHelper.h"

@implementation TRGoogleClient

NSString* const BASE_API_URL = @"https://www.googleapis.com/";
NSString* const API_METHOD_TRANSLATE = @"language/translate/v2";

    
- (void)translateEnWord:(NSString* _Nonnull)enWord completionHandler:(nullable void (^)(NSString * _Nonnull word, NSError * _Nullable error)) completionHandler{
    
    [self doRequestApiMethod:API_METHOD_TRANSLATE getParams:@{@"source": @"ru", @"target": @"en", @"q": enWord} completionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString* word = @"";
            if(error){
                completionHandler(word, error);
            }else{
                NSDictionary* err = [JSONHelper parseDictFrom:data byKey:@"error"];
                if(err.count>0){
                    completionHandler(word, [NSError errorWithDomain:@"Translator" code:1 userInfo:nil]);
                }else{
                    NSDictionary* d = [JSONHelper parseDictFrom:data byKey:@"data"];
                    NSArray* translations = [JSONHelper parseArrayFrom:d byKey:@"translations"];
                    if(translations.count>0){
                        word = [JSONHelper parseStringFrom:[translations firstObject] byKey:@"translatedText"];
                    }
                    
                    completionHandler(word, error);
                }
                
            }
        });
    }];

}

+ (instancetype) sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super alloc] initInstance];
    });
    return sharedInstance;
}

- (instancetype) initInstance {
    self = [super init];
    self.apiBaseUrl = BASE_API_URL;
    return self;
}

@end