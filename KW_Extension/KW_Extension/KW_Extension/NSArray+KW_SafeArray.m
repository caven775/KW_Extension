//
//  NSArray+KW_SafeArray.m
//  KW_Extension
//
//  Created by LKW on 2018/6/8.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "NSArray+KW_SafeArray.h"
#import "NSObject+KW_MethodSwizzling.h"

@implementation NSArray (KW_SafeArray)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSPlaceholderArray");
        if (class != NULL) {
            [class methodSwizzlingWithOriginalSelector:@selector(initWithObjects:count:)
                                    bySwizzledSelector:@selector(kw_initWithObjects:count:)];
        }
        
        Class class_I = NSClassFromString(@"__NSArrayI");
        if (class_I != NULL) {
            [class_I methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)
                                      bySwizzledSelector:@selector(kw_objectAtIndex:)];
            [class_I methodSwizzlingWithOriginalSelector:@selector(objectAtIndexedSubscript:)
                                      bySwizzledSelector:@selector(kw_objectAtIndexedSubscript:)];
        }
        
        Class class_O = NSClassFromString(@"__NSArray0");
        if (class_O != NULL) {
            [class_O methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)
                                      bySwizzledSelector:@selector(kw_emptyObjectAtIndex:)];
        }
    });
}

- (instancetype)kw_initWithObjects:(const id[])objects
                             count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id obj = objects[i];
        if (!obj) { obj = [NSNull null];}
        safeObjects[j] = obj;
        j++;
    }
    return [self kw_initWithObjects:safeObjects count:j];
}

- (id)kw_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        NSLog(@"‼️ index beyond bounds, return nil");
        return nil;
    }
    return [self kw_objectAtIndex:index];
}

- (id)kw_objectAtIndexedSubscript:(NSUInteger)idx
{
    if (idx >= self.count) {
        NSLog(@"‼️  index beyond bounds, return nil");
        return nil;
    }
    return [self kw_objectAtIndexedSubscript:idx];
}

- (id)kw_emptyObjectAtIndex:(NSUInteger)index
{
    if (self.count == 0) {
        NSLog(@"‼️ array is empty, return nil");
        return nil;
    }
    return [self kw_emptyObjectAtIndex:index];
}

@end





@implementation NSMutableArray (KW_SafeMutableArray)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class_M = NSClassFromString(@"__NSArrayM");
        if (class_M != NULL) {
            [class_M methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:)
                                      bySwizzledSelector:@selector(kw_objectAtIndex:)];
            [class_M methodSwizzlingWithOriginalSelector:@selector(objectAtIndexedSubscript:)
                                      bySwizzledSelector:@selector(kw_objectAtIndexedSubscript:)];
        }
    });
}

- (id)kw_objectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        NSLog(@"‼️ index beyond bounds, return nil");
        return nil;
    }
    return [self kw_objectAtIndex:index];
}

- (id)kw_objectAtIndexedSubscript:(NSUInteger)idx
{
    if (idx >= self.count) {
        NSLog(@"‼️  index beyond bounds, return nil");
        return nil;
    }
    return [self kw_objectAtIndexedSubscript:idx];
}

@end
