//
//  UIView+Animation.m
//  无限轮播的动画
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "UIView+Animation.h"
#import "LDAnimationView.h"

@implementation UIView (Animation)
+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array
{
    return [[LDAnimationView alloc] initWithFrame:frame withImageArray:array];
}
+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array target:(id)obj
{
    LDAnimationView * animationView = [[LDAnimationView alloc] initWithFrame:frame withImageArray:array];
    animationView.delegate = obj;
    return animationView;
}
+ (instancetype)endlessAnimationWithRect:(CGRect)frame withArray:(NSArray *)array target:(id)obj animationTypeName:(NSString *)name
{
    LDAnimationView * animationView = [[LDAnimationView alloc] initWithFrame:frame withImageArray:array withTypeName:name];
    animationView.delegate = obj;
    return animationView;
}
@end
