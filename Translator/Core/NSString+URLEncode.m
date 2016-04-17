//
//  NSString+URLEncode.m
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString(URLEncode)
- (NSString*)urlEncode{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end
