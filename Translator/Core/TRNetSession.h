//
//  TRNetSession.h
//  Translator
//
//  Created by Руслан on 16.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRNetSession : NSObject
//AIzaSyA6etmERLBO9rxgBKz7bwt_aVRqXaqhmmA
- (void)doRequestApiMethod:(NSString * _Nonnull)apiMethod getParams:(NSDictionary * _Nullable)params completionHandler:(nullable void (^)(NSDictionary * _Nullable data, NSError * _Nullable error)) completionHandler;
@property (nonatomic, weak) NSString* apiBaseUrl;
@property (nonatomic, weak) NSString* apiKey;
@end
