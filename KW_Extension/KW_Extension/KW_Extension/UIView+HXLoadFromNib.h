//
//  UIView+HXLoadFromNib.h
//  KW_Extension
//
//  Created by 林克文 on 2018/7/3.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HXLoadFromNib)

+ (instancetype)kw_loadFromNib;
- (UINib *)hx_nibWithClass:(Class)nibClass;

@end


@interface UIViewController (HXLoadFromStoryboard)

+ (UIViewController *)hx_loadFromStroyboard;
+ (UIViewController *)hx_loadFromStroyboard:(NSString *)storyboardName;
+ (UIViewController *)hx_loadFromStroyboard:(NSString *)storyboardName identifier:(NSString *)identifier;

@end


@interface UITableViewCell (HXNibTableViewCell)

@property (nonatomic, copy, readonly, class) NSString * identifier;

@end


@interface UICollectionViewCell (HXNibCollectionViewCell)

@property (nonatomic, copy, readonly, class) NSString * identifier;

@end


@interface UITableView (HXRegisterTableViewCell)

- (void)hx_registerCellWithNib:(Class)aClass;
- (void)hx_registerCellWithClass:(Class)aClass;
- (void)hx_registerHeaderFooterWithNib:(Class)aClass;
- (void)hx_registerHeaderFooterWithClass:(Class)aClass;

@end


@interface UICollectionView (HXRegisterCollectionViewCell)

- (void)hx_registerCellWithNib:(Class)aClass;
- (void)hx_registerCellWithClass:(Class)aClass;
- (void)hx_registerHeaderWithNib:(Class)aClass;
- (void)hx_registerHeaderWithClass:(Class)aClass;
- (void)hx_registerFooterWithNib:(Class)aClass;
- (void)hx_registerFooterWithClass:(Class)aClass;

@end
