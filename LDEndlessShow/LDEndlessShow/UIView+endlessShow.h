//
//  UIView+endlessShow.h
//  LDEndlessShow
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (endlessShow)
/** 
  * 调用此方法即可根据图片数组与frame返回一个图片轮播器
 */
+ (instancetype)endlessWithframe:(CGRect)frame withImageArray:(NSMutableArray *)array;
/**
 * 调用此方法即可根据图片数组与frame返回一个图片轮播器,并且监听点击事件
 */
+ (instancetype)endlessWithframe:(CGRect)frame withImageArray:(NSMutableArray *)array withTarget:(id)obj;
@end
