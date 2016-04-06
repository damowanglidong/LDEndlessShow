//
//  UIView+endlessShow.m
//  LDEndlessShow
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "UIView+endlessShow.h"
#import "LDHeaderView.h"

@implementation UIView (endlessShow)

+ (instancetype)endlessWithframe:(CGRect)frame withImageArray:(NSMutableArray *)array{
    
    return [[LDHeaderView alloc] initWithFrame:frame withImagesArray:array];

}

+ (instancetype)endlessWithframe:(CGRect)frame withImageArray:(NSMutableArray *)array withTarget:(id)obj{
    
    LDHeaderView * headerView = [[LDHeaderView alloc] initWithFrame:frame withImagesArray:array];
    
    headerView.delegate = obj;
    
    return headerView;
    
}
@end
