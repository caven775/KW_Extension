//
//  UIAlertController+HXAlert.m
//  KW_Extension
//
//  Created by TAL on 2018/7/11.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "UIAlertController+HXAlert.h"

@implementation UIAlertController (HXAlert)

- (void)hx_addActions:(NSArray<UIAlertAction *> *)actions
{
    [actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addAction:obj];
    }];
}

- (void)hx_show
{
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:self
                                                                                             animated:YES
                                                                                           completion:nil];
}

@end
