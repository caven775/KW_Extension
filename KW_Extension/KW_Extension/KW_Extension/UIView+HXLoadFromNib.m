//
//  UIView+HXLoadFromNib.m
//  KW_Extension
//
//  Created by 林克文 on 2018/7/3.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "UIView+HXLoadFromNib.h"

@implementation UIView (HXLoadFromNib)

+ (instancetype)kw_loadFromNib
{
    UIView * nibView = nil;
    NSBundle * bundle = [NSBundle bundleForClass:self];
    NSArray * objects = [bundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    for (id x in objects) {
        if ([x isKindOfClass:[self class]]) {
            nibView = (UIView *)x;
        }
    }
    NSAssert(nibView != nibView, @"未找到%@", NSStringFromClass(self));
    return nibView;
}

- (UINib *)hx_nibWithClass:(Class)nibClass
{
    return [UINib nibWithNibName:NSStringFromClass(nibClass) bundle:[NSBundle mainBundle]];
}

@end


@implementation UIViewController (HXLoadFromStoryboard)

+ (UIViewController *)hx_loadFromStroyboard
{
    return [self hx_loadFromStroyboard:@"Main" identifier:NSStringFromClass([self class])];
}

+ (UIViewController *)hx_loadFromStroyboard:(NSString *)storyboardName
{
    return [self hx_loadFromStroyboard:storyboardName identifier:NSStringFromClass([self class])];
}

+ (UIViewController *)hx_loadFromStroyboard:(NSString *)storyboardName identifier:(NSString *)identifier
{
    NSAssert(storyboardName.length != 0, @"输入正确的storyboardName");
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:identifier];
    NSParameterAssert(vc != nil);
    return vc;
}

@end


@implementation UITableViewCell (HXNibTableViewCell)

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

@end

@implementation UICollectionViewCell (HXNibCollectionViewCell)


+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

@end


@implementation UITableView (HXRegisterTableViewCell)

- (void)hx_registerCellWithNib:(Class)aClass
{
    [self registerNib:[self hx_nibWithClass:aClass] forCellReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerCellWithClass:(Class)aClass
{
    [self registerClass:aClass forCellReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerHeaderFooterWithNib:(Class)aClass
{
    [self registerNib:[self hx_nibWithClass:aClass] forHeaderFooterViewReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerHeaderFooterWithClass:(Class)aClass
{
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(aClass)];
}

@end

@implementation UICollectionView (HXRegisterCollectionViewCell)

- (void)hx_registerCellWithNib:(Class)aClass
{
    [self registerNib:[self hx_nibWithClass:aClass] forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerCellWithClass:(Class)aClass
{
    [self registerClass:aClass forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerHeaderWithNib:(Class)aClass
{
    [self hx_registerHeaderFooterWithNib:aClass headerFooter:UICollectionElementKindSectionHeader];
}

- (void)hx_registerHeaderWithClass:(Class)aClass
{
    [self hx_registerHeaderFooterWithClass:aClass headerFooter:UICollectionElementKindSectionHeader];
}

- (void)hx_registerFooterWithNib:(Class)aClass
{
    [self hx_registerHeaderFooterWithNib:aClass headerFooter:UICollectionElementKindSectionFooter];
}

- (void)hx_registerFooterWithClass:(Class)aClass
{
    [self hx_registerHeaderFooterWithClass:aClass headerFooter:UICollectionElementKindSectionFooter];
}

- (void)hx_registerHeaderFooterWithNib:(Class)aClass headerFooter:(NSString *)headerFooter
{
    [self registerNib:[self hx_nibWithClass:aClass] forSupplementaryViewOfKind:headerFooter withReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)hx_registerHeaderFooterWithClass:(Class)aClass
                            headerFooter:(NSString *)headerFooter
{
    [self registerClass:aClass forSupplementaryViewOfKind:headerFooter withReuseIdentifier:NSStringFromClass(aClass)];
}


@end




