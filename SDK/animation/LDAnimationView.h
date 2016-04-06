//
//  LDAnimationView.h
//  无限轮播的动画
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDAnimationView;

@protocol LDAnimationViewDelegate <NSObject>
@optional;
- (void)animationView:(LDAnimationView *)animationView didSeletedAtIndex:(NSInteger)index;

@end

@interface LDAnimationView : UIView

- (instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)array;
- (instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)array withTypeName:(NSString *)typeName;

@property (nonatomic, weak) id<LDAnimationViewDelegate>delegate;

@property (nonatomic, copy) NSString * typeName;
@end
