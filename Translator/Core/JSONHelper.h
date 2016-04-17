//
//  JSONHelper.h
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONHelper : NSObject
+ (NSString *) parseStringFrom:(NSDictionary *)jsonObject byKey:(NSString *)key;
+ (NSArray *) parseArrayFrom:(NSDictionary *)jsonObject byKey:(NSString *)key;
+ (NSDictionary *) parseDictFrom:(NSDictionary *)jsonObject byKey:(NSString *)key;
@end
