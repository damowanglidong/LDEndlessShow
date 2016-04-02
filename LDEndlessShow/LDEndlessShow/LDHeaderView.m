//
//  LDHeaderView.m
//  LDEndlessShow
//
//  Created by 李东 on 16/3/31.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHeaderView.h"
#import <UIImageView+WebCache.h>

@interface LDHeaderView () <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray * imgs;

@property (nonatomic, strong) UIPageControl * pageControl;

@property (nonatomic, strong) NSTimer * timer;

@property (nonatomic, strong) UIScrollView * scrollView;
@end

@implementation LDHeaderView

- (NSMutableArray *)imgs
{
    if (_imgs == nil)
    {
        _imgs = [NSMutableArray array];
    }
    return _imgs;
}

//构造方法的重写
- (instancetype)initWithFrame:(CGRect)frame withImagesArray:(NSMutableArray *)array
{
    if (self = [super initWithFrame:frame])
    {

        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self initScrollView];
        
        [self addSubview:self.scrollView];
        if (array.count == 0)
        {
            return self;
        }
        [array insertObject:array[array.count - 1] atIndex:0];
        [array addObject:array[1]];
        self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * array.count, 0);
        CGFloat x = 0;
        
        for (int i = 0; i < array.count; i++)
        {
            UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
            if ([array[i] hasPrefix:@"http://"])
            {
                //根据图片地址下载图片
                [imgView sd_setImageWithURL:[NSURL URLWithString:array[i]]];
            }else
            {
                UIImage  * image =[UIImage imageNamed:array[i]];
                imgView .image = image;
                [self.imgs addObject:image];
            }
            imgView.tag = i ;
            imgView.userInteractionEnabled = YES;
            [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickImageView:)]];
            [self.scrollView addSubview:imgView];
            x += self.bounds.size.width;
        }
        [self initPageControl];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(pageCountUpdata:) userInfo:nil repeats:YES];
    }

    return self;
}

- (void)didClickImageView:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(headerView:didSeletedAtIndex:withImages:)])
    {
        [self.delegate headerView:(LDHeaderView *)tap.view didSeletedAtIndex:tap.view.tag withImages:self.imgs ];
    }


}

- (void)initScrollView
{
    self.scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
}

- (void)initPageControl
{
    CGFloat w = 100;
    CGFloat x = (self.frame.size.width - w) * 0.5;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, self.frame.size.height * 0.9, w, 0)];
    self.pageControl.numberOfPages = self.imgs.count - 2;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.currentPage   = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:_pageControl];

}

//实现scroll的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger offset = scrollView.contentOffset.x / self.bounds.size.width;
    if (offset <= 1)
    {
        self.pageControl.currentPage = 0;
    }else if (offset >= self.imgs.count - 2)
    {
        self.pageControl.currentPage = self.imgs.count - 3;
    }else
    {
        self.pageControl.currentPage = offset - 1;
    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offset = scrollView.contentOffset.x / self.bounds.size.width;
    if (offset <= 0)
    {
        scrollView.contentOffset = CGPointMake(self.bounds.size.width * (self.imgs.count - 2), 0);
    }
    if (offset >self.imgs.count - 2)
    {
        scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    }

}

- (void)pageCountUpdata:(id)sender
{
    static NSInteger num = 0;
    if (num <= self.imgs.count -2 && num != self.pageControl.currentPage)
    {
        num = self.pageControl.currentPage+1;
    }
    else
    {
        if (num > self.imgs.count-2)
        {
            num = 0;
        }
        num++;
    }
    [self changeScrollView:num];
}
- (void)changeScrollView:(NSInteger)integer
{
    if (integer == self.imgs.count -2)
    {
        [UIView animateWithDuration:0.5f animations:^{
            [_scrollView setContentOffset:CGPointMake((integer+1) * self.bounds.size.width, 0)];
        } completion:^(BOOL finished) {
            [self scrollViewDidEndDecelerating:_scrollView];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5f animations:^{
            [_scrollView setContentOffset:CGPointMake((integer+1) *  self.bounds.size.width, 0)];
        }];
    }
}

- (void)dealloc
{
    [self.timer invalidate];
}

@end
