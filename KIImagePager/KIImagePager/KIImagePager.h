//
//  KIImagePager.h
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class KIImagePager;

@protocol KIImagePagerDataSource <NSObject>

@required
- (NSArray *) arrayWithImages;
- (UIViewContentMode) contentModeForImage:(NSUInteger)image;

@optional
- (UIImage *) placeHolderImageForImagePager;
- (NSString *) captionForImageAtIndex:(NSUInteger)index;
- (UIViewContentMode) contentModeForPlaceHolder;

@end

@protocol KIImagePagerDelegate <NSObject>

@optional
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index;
- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index;

@end

@interface KIImagePager : UIView

// Delegate and Datasource
@property (weak) IBOutlet id <KIImagePagerDataSource> dataSource;
@property (weak) IBOutlet id <KIImagePagerDelegate> delegate;

// General
@property (nonatomic) UIViewContentMode contentMode;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) BOOL indicatorDisabled;
@property (nonatomic) BOOL bounces;
@property (nonatomic) BOOL imageCounterDisabled;
@property (nonatomic) BOOL hidePageControlForSinglePages; // Defaults YES

// Slideshow
@property (nonatomic) NSUInteger slideshowTimeInterval; // Defaults 0.0f (off)
@property (nonatomic) BOOL slideshowShouldCallScrollToDelegate; // Defaults YES

// Caption Label
@property (nonatomic, strong) UIColor *captionTextColor; // Defaults Black
@property (nonatomic, strong) UIColor *captionBackgroundColor; // Defaults White (with an alpha of .7f)
@property (nonatomic, strong) UIFont *captionFont; // Defaults to Helvetica 12.0f points

- (void) reloadData;
- (void) setCurrentPage:(NSUInteger)currentPage animated:(BOOL)animated;

@end

