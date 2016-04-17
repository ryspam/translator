//
//  TRDataUpdater.h
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordPair.h"

@interface TRDataUpdater : NSObject
+ (instancetype _Nullable) sharedInstance;
- (void)start;
- (void)loadWordPair:(WordPair* _Nonnull)item;
@end
