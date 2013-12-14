//
//  KIViewController.m
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import "KIViewController.h"

@interface KIViewController () <KIImagePagerDelegate, KIImagePagerDataSource>
{
    IBOutlet KIImagePager *_imagePager;
}
@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _imagePager.slideshowTimeInterval = 1.5f;
    _imagePager.slideshowShouldCallScrollToDelegate = YES;
}

#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages
{
    return [NSArray arrayWithObjects:
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen1.png",
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen2.png",
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen3.png",
            nil];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    NSLog(@"%s %d", __PRETTY_FUNCTION__, index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    NSLog(@"%s %d", __PRETTY_FUNCTION__, index);
}

@end
