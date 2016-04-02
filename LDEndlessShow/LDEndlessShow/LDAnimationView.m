//
//  LDAnimationView.m
//  无限轮播的动画
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDAnimationView.h"
#import <UIImageView+WebCache.h>

@interface LDAnimationView ()


@property (nonatomic, strong) CATransition * transition;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) NSArray * imgArray;

@property (nonatomic, strong) UIImageView * imgView;

@property (nonatomic, strong) CADisplayLink * displayLink;

@property (nonatomic, strong) UIPageControl * pageControl;
@end

@implementation LDAnimationView
- (CATransition *)transition
{
    if (_transition == nil)
    {
        _transition = [[CATransition alloc] init];
        _transition.type = self.typeName;
        _transition.duration = 2.0;
        _transition.subtype = kCATransitionFromRight;
    }
    
    return _transition;
}
- (instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)array
{
    if (self = [super initWithFrame:frame])
    {
        
        self.imgArray = array;
        [self initImageView];
        [self initPageControl];
        [self initAnimation];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)array withTypeName:(NSString *)typeName
{
    if (self = [super initWithFrame:frame])
    {
        self.typeName = typeName;
        self.imgArray = array;
        [self initImageView];
        [self initPageControl];
        [self initAnimation];
    }
    return self;
}
- (void)initImageView
{
    self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imgView.image = [UIImage imageNamed:self.imgArray[0]];
    self.imgView.userInteractionEnabled = YES;
    [self addSubview:self.imgView];
}
- (void)initPageControl
{
    CGFloat w = 100;
    CGFloat x = (self.frame.size.width - w) * 0.5;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, self.frame.size.height * 0.9, w, 21)];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.imgArray.count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview: self.pageControl];
}
- (void)initAnimation
{
    [self addPageCount];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(addPageCount)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.displayLink.frameInterval = 150;
    });
    
}

- (void)addPageCount
{
    self.index = -1;
    self.index ++;
    if (self.index == self.imgArray.count)
    {
        self.index = 0;
    }
    self.pageControl.currentPage = self.index;
    if ([self.imgArray[self.index] hasPrefix:@"http://"])
    {
        //通过图片地址下载图片
        [self.imgView sd_setImageWithURL:self.imgArray[self.index]];
    }else{
        
        NSString * imgName = self.imgArray[self.index];
        
        self.imgView.image = [UIImage imageNamed:imgName];
    }
    self.imgView.tag = self.index;
    [self.imgView.layer addAnimation:self.transition forKey:@"anim"];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImg:)];
    [self.imgView addGestureRecognizer:tap];
}
- (void)clickImg:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(animationView:didSeletedAtIndex:)]) {
        [self.delegate animationView:self didSeletedAtIndex:tap.view.tag];
    }
}
@end
