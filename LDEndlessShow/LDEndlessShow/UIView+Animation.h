//
//  UIView+Animation.h
//  无限轮播的动画
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Animation)

+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array;

+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array target:(id)obj;

+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array target:(id)obj animationTypeName:(NSString *)name;
@end
