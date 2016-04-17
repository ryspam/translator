//
//  TRNetSession.m
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRNetSession.h"
#import "NSString+URLEncode.h"

@interface TRNetSession () <NSURLSessionDelegate>

@end

@implementation TRNetSession

- (void)doRequestApiMethod:(NSString * _Nonnull)apiMethod getParams:(NSDictionary * _Nullable)params completionHandler:(nullable void (^)(NSDictionary * _Nullable data, NSError * _Nullable error)) completionHandler{
    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];

    NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@", self.apiBaseUrl, apiMethod];
    [urlString appendString:[NSString stringWithFormat:@"?key=%@", self.apiKey]];
    
    for(NSString* key in params.allKeys){
        [urlString appendString:[NSString stringWithFormat:@"&%@=%@", key, params[key]]];
    }
    
    NSURL *url = [NSURL URLWithString:[urlString urlEncode]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            completionHandler(nil, error);
        }else{
            NSError *jsonError = nil;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            if(jsonError){
                completionHandler(nil, jsonError);
            }else{
                completionHandler(json, jsonError);
            }
        }
    }];
    
    [task resume];
    
}

@end
