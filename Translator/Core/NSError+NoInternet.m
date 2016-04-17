//
//  NSError+NoInternet.m
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "NSError+NoInternet.h"

@implementation NSError(NoInternet)
- (BOOL)isNoInternet
{
    return ([self.domain isEqualToString:NSURLErrorDomain] && (self.code == NSURLErrorNotConnectedToInternet));
}
@end
