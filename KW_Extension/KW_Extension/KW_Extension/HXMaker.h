//
//  HXMaker.h
//  KW_Extension
//
//  Created by 林克文 on 2018/6/12.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXMaker : NSObject

@property (nonatomic, strong, readonly) UILabel * lInstall;
@property (nonatomic, strong, readonly) UIButton * bInstall;
@property (nonatomic, strong, readonly) UIImageView * iInstall;

@end

@interface HXMaker (UILabel)

@property (nonatomic, copy, readonly) HXMaker * (^lFrame)(CGRect frame);
@property (nonatomic, copy, readonly) HXMaker * (^lFont)(UIFont * font);
@property (nonatomic, copy, readonly) HXMaker * (^lText)(NSString * text);
@property (nonatomic, copy, readonly) HXMaker * (^lTextColor)(UIColor * textColor);
@property (nonatomic, copy, readonly) HXMaker * (^lBackgroundColor)(UIColor * color);
@property (nonatomic, copy, readonly) HXMaker * (^lBreakMode)(NSLineBreakMode mode);
@property (nonatomic, copy, readonly) HXMaker * (^lTextAlignment)(NSTextAlignment alignment);
@property (nonatomic, copy, readonly) HXMaker * (^lAttributeText)(NSAttributedString * attributeText);

@end


@interface HXMaker (UIButton)

@property (nonatomic, copy, readonly) HXMaker * (^bFrame)(CGRect frame);
@property (nonatomic, copy, readonly) HXMaker * (^bFont)(UIFont * font);
@property (nonatomic, copy, readonly) HXMaker * (^bBackgroundColor)(UIColor * color);
@property (nonatomic, copy, readonly) HXMaker * (^bTitle)(NSString * title, UIControlState state);
@property (nonatomic, copy, readonly) HXMaker * (^bTitleColor)(UIColor * color, UIControlState sate);
@property (nonatomic, copy, readonly) HXMaker * (^bImage)(UIImage * image, UIControlState state);
@property (nonatomic, copy, readonly) HXMaker * (^bBackgroundImage)(UIImage * image, UIControlState state);
@property (nonatomic, copy, readonly) HXMaker * (^bAttributeTitle)(NSAttributedString * attributeTitle, UIControlState state);

@end


@interface HXMaker (UIImageView)

@property (nonatomic, copy, readonly) HXMaker * (^iFrame)(CGRect frame);
@property (nonatomic, copy, readonly) HXMaker * (^image)(UIImage * image);

@end



@interface UILabel (HXMaker)

@property (nonatomic, strong, readonly, class) HXMaker * maker;

@end


@interface UIButton (HXMaker)

@property (nonatomic, strong, readonly, class) HXMaker * maker;

@end


@interface UIImageView (HXMaker)

@property (nonatomic, strong, readonly, class) HXMaker * maker;

@end
