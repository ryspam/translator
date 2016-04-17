//
//  JSONHelper.m
//  Translator
//
//  Created by Руслан on 17.04.16.
//  Copyright © 2016 rsianov. All rights reserved.
//

#import "JSONHelper.h"

@implementation JSONHelper

+ (NSString *) parseStringFrom:(NSDictionary *)jsonObject byKey:(NSString *)key {
    if (!jsonObject) {
        return @"";
    }
    if(jsonObject.count==0) return @"";
    NSString *data = [jsonObject objectForKey:key];
    if ([data isKindOfClass:[NSString class]]) {
        return data;
    }
    if (!data) {
        return @"";
    }
    if ([data isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", data];
}

+ (NSDictionary *) parseDictFrom:(NSDictionary *)jsonObject byKey:(NSString *)key {
    if (!jsonObject) {
        return [[NSDictionary alloc]init];
    }
    NSDictionary *data = [jsonObject objectForKey:key];
    if ([data isKindOfClass:[NSDictionary class]]) {
        return data;
    }
    if (!data) {
        return [[NSDictionary alloc]init];
    }
    if ([data isKindOfClass:[NSNull class]]) {
        return [[NSDictionary alloc]init];
    }
    return data;
}

+ (NSArray *) parseArrayFrom:(NSDictionary *)jsonObject byKey:(NSString *)key {
    if (!jsonObject) {
        return [[NSArray alloc]init];
    }
    NSArray *data = [jsonObject objectForKey:key];
    if ([data isKindOfClass:[NSArray class]]) {
        return data;
    }
    if (!data) {
        return [[NSArray alloc]init];
    }
    if ([data isKindOfClass:[NSNull class]]) {
        return [[NSArray alloc]init];
    }
    return data;
}

@end
