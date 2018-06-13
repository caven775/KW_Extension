//
//  HXMaker.m
//  KW_Extension
//
//  Created by 林克文 on 2018/6/12.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "HXMaker.h"

@interface HXMaker ()

@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UITextView * textView;
@property (nonatomic, strong) UITextField * textfield;

@end

@implementation HXMaker

- (UILabel *)lInstall
{
    return self.label;
}

- (UIButton *)bInstall
{
    return self.button;
}

- (UIImageView *)iInstall
{
    return self.imageView;
}

@end


@implementation HXMaker (UILabel)

- (HXMaker *(^)(CGRect))lFrame
{
    return ^(CGRect frame) {
        self.label.frame = frame;
        return self;
    };
}

- (HXMaker *(^)(UIFont *))lFont
{
    return ^(UIFont * font) {
        self.label.font = font;
        return self;
    };
}

- (HXMaker *(^)(NSString *))lText
{
    return ^(NSString * text) {
        self.label.text = text;
        return self;
    };
}

- (HXMaker *(^)(UIColor *))lTextColor
{
    return ^(UIColor * color) {
        self.label.textColor = color;
        return self;
    };
}

- (HXMaker *(^)(UIColor *))lBackgroundColor
{
    return ^(UIColor * backgroundColor) {
        self.label.backgroundColor = backgroundColor;
        return self;
    };
}

- (HXMaker *(^)(NSAttributedString *))lAttributeText
{
    return ^(NSAttributedString * attributeText) {
        self.label.attributedText = attributeText;
        return self;
    };
}

- (HXMaker *(^)(NSTextAlignment))lTextAlignment
{
    return ^(NSTextAlignment alignment) {
        self.label.textAlignment = alignment;
        return self;
    };
}

- (HXMaker *(^)(NSLineBreakMode))lBreakMode
{
    return ^(NSLineBreakMode mode) {
        self.label.lineBreakMode = mode;
        return self;
    };
}

@end


@implementation HXMaker (UIButton)

- (HXMaker *(^)(CGRect))bFrame
{
    return ^(CGRect frame) {
        self.button.frame = frame;
        return self;
    };
}

- (HXMaker *(^)(UIFont *))bFont
{
    return ^(UIFont * font) {
        self.button.titleLabel.font = font;
        return self;
    };
}

- (HXMaker *(^)(NSString *, UIControlState))bTitle
{
    return ^(NSString * title, UIControlState state) {
        [self.button setTitle:title forState:state];
        return self;
    };
}

- (HXMaker *(^)(UIColor *, UIControlState))bTitleColor
{
    return ^(UIColor * color, UIControlState state){
        [self.button setTitleColor:color forState:state];
        return self;
    };
}

- (HXMaker *(^)(UIColor *))bBackgroundColor
{
    return ^(UIColor * color) {
        self.button.backgroundColor = color;
        return self;
    };
}

- (HXMaker *(^)(UIImage *, UIControlState))bImage
{
    return ^(UIImage * image, UIControlState state) {
        [self.button setImage:image forState:state];
        return self;
    };
}

- (HXMaker *(^)(UIImage *, UIControlState))bBackgroundImage
{
    return ^(UIImage * image, UIControlState state) {
        [self.button setBackgroundImage:image forState:state];
        return self;
    };
}

- (HXMaker *(^)(NSAttributedString *, UIControlState))bAttributeTitle
{
    return ^(NSAttributedString * attributeTitle, UIControlState state) {
        [self.button setAttributedTitle:attributeTitle forState:state];
        return self;
    };
}

@end


@implementation HXMaker (UIImageView)

- (HXMaker *(^)(CGRect))iFrame
{
    return ^(CGRect frame) {
        self.imageView.frame = frame;
        return self;
    };
}

- (HXMaker *(^)(UIImage *))iImage
{
    return ^(UIImage * image) {
        self.imageView.image = image;
        return self;
    };
}

@end


@implementation HXMaker (UITextField)

- (HXMaker *(^)(CGRect))tFrame
{
    return ^(CGRect frame) {
        self.textfield.frame = frame;
        return self;
    };
}

- (HXMaker *(^)(UIFont *))tFont
{
    return ^(UIFont * font) {
        self.textfield.font = font;
        return self;
    };
}

- (HXMaker *(^)(UIColor *))tTextColor
{
    return ^(UIColor * color) {
        self.textfield.textColor = color;
        return self;
    };
}

@end


@implementation HXMaker (UITextView)

@end




@implementation UILabel (HXMaker)

+ (HXMaker *)maker
{
    HXMaker * make = [[HXMaker alloc] init];
    make.label = [[UILabel alloc] init];
    return make;
}

@end

@implementation UIButton (HXMaker)

+ (HXMaker *)maker
{
    HXMaker * make = [[HXMaker alloc] init];
    make.button = [UIButton buttonWithType:UIButtonTypeCustom];
    return make;
}

@end


@implementation UIImageView (HXMaker)

+ (HXMaker *)maker
{
    HXMaker * make = [[HXMaker alloc] init];
    make.imageView = [[UIImageView alloc] init];
    return make;
}

@end

