//
//  KIImagePager.m
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#define kPageControlHeight  30

#import "KIImagePager.h"

@interface KIImagePager () <UIScrollViewDelegate>
{
    __weak id <KIImagePagerDataSource> _dataSource;
    __weak id <KIImagePagerDelegate> _delegate;
    
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@end

@implementation KIImagePager

@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;
@synthesize contentMode = _contentMode;
@synthesize pageControl = _pageControl;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) awakeFromNib
{
    [super awakeFromNib];
}

- (void) layoutSubviews
{
    [self initialize];
}

#pragma mark - General
- (void) initialize
{
    [self initializeScrollView];
    [self initializePageControl];
}

- (UIColor *) randomColor
{
    return [UIColor colorWithHue:(arc4random() % 256 / 256.0)
                      saturation:(arc4random() % 128 / 256.0) + 0.5
                      brightness:(arc4random() % 128 / 256.0) + 0.5
                           alpha:1];
}

#pragma mark - ScrollView Initialization
- (void) initializeScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.autoresizingMask = self.autoresizingMask;
    [self addSubview:_scrollView];
    
    NSArray *aImageUrls = (NSArray *)[_dataSource arrayWithImageUrlStrings];
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * [aImageUrls count],
                                           _scrollView.frame.size.height)];
    
    for (int i = 0; i < [aImageUrls count]; i++)
    {
        CGRect imageFrame = CGRectMake(_scrollView.frame.size.width * i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        [imageView setBackgroundColor:[self randomColor]];
        [imageView setContentMode:[_dataSource contentModeForImage:i]];
        [imageView setImageWithURL:[NSURL URLWithString:(NSString *)[aImageUrls objectAtIndex:i]]];
        [_scrollView addSubview:imageView];
    }
}

#pragma mark - PageControl Initialization
- (void) initializePageControl
{
    CGRect pageControlFrame = CGRectMake(0, 0, _scrollView.frame.size.width, kPageControlHeight);
    _pageControl = [[UIPageControl alloc] initWithFrame:pageControlFrame];
    _pageControl.center = CGPointMake(_scrollView.frame.size.width/2, _scrollView.frame.size.height - kPageControlHeight);
    _pageControl.numberOfPages = [(NSArray *)[_dataSource arrayWithImageUrlStrings] count];
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_pageControl];
}

#pragma mark - ScrollView Delegate;
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = lround((float)scrollView.contentOffset.x / scrollView.frame.size.width);
}

@end
