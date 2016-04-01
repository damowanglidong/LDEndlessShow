//
//  LDHeaderView.h
//  LDEndlessShow
//
//  Created by 李东 on 16/3/31.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDHeaderView;

@protocol LDHeaderViewDelegate <NSObject>

- (void)headerView:(LDHeaderView *)headerView didSeletedAtIndex:(NSInteger)index withImages:(NSArray *)imgs;

@end

@interface LDHeaderView : UIView

+ (UIView *) endlessWithImageArray:(NSArray *) array withRect:(CGRect)rect;
- (instancetype)initWithFrame:(CGRect)frame withImagesArray:(NSMutableArray *)array;
@property (nonatomic, weak)id<LDHeaderViewDelegate> delegate;
@end
