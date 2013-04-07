//
//  KIImagePager.h
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KIImagePager;

@protocol KIImagePagerDataSource

- (NSUInteger) numberOfImages;
- (NSString *) urlStringForImageAtIndex:(NSUInteger)index;

@end

@protocol KIImagePagerDelegate

- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index;

@end

@interface KIImagePager : UIView

@property (weak) id <KIImagePagerDataSource> dataSource;
@property (weak) id <KIImagePagerDelegate> delegate;

@end

