//
//  KW_System.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KW_System : NSObject

@property (nonatomic, copy, readonly, class) NSString * appVersion;
@property (nonatomic, copy, readonly, class) NSString * appBuildVersion;
@property (nonatomic, copy, readonly, class) NSString * UUID;

@end
