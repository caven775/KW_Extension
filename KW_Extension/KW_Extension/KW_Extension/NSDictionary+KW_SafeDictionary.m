//
//  NSDictionary+KW_SafeDictionary.m
//  KW_Extension
//
//  Created by LKW on 2018/6/8.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "NSDictionary+KW_SafeDictionary.h"
#import "NSObject+KW_MethodSwizzling.h"

@implementation NSDictionary (KW_SafeDictionary)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSPlaceholderDictionary");
        if (class != NULL) {
            [class methodSwizzlingWithOriginalSelector:@selector(initWithObjects:forKeys:count:)
                                    bySwizzledSelector:@selector(kw_initWithObjects:forKeys:count:)];
        }
    });
}

- (instancetype)kw_initWithObjects:(const id [])objects
                           forKeys:(const id<NSCopying> [])keys
                             count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) { continue;}
        if (!obj) { obj = [NSNull null];}
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self kw_initWithObjects:safeObjects forKeys:safeKeys count:j];
}


@end
