//
//  NSError+NoInternet.h
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError(NoInternet)
- (BOOL)isNoInternet;
@end
