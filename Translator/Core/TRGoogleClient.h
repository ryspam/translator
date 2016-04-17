//
//  TRGoogleClient.h
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "TRNetSession.h"

@interface TRGoogleClient : TRNetSession
+ (instancetype _Nullable) sharedInstance;
- (void)translateEnWord:(NSString* _Nonnull)enWord completionHandler:(nullable void (^)(NSString * _Nullable word, NSError * _Nullable error)) completionHandler;
@end
