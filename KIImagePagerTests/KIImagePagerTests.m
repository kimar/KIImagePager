//
//  KIImagePagerTests.m
//  KIImagePagerTests
//
//  Created by Marcus Kida on 13.07.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "KIImagePager.h"

@interface KIImagePager (Private)

- (void) initialize;

@end

@interface KIImagePagerTests : SenTestCase <KIImagePagerDataSource>
{
    KIImagePager *_sut;
    id _imageArray;
}
@end

@implementation KIImagePagerTests

- (void)setUp
{
    [super setUp];
    _sut = [[KIImagePager alloc] init];
    [_sut setDataSource:self];
}

- (void)tearDown
{
    [super tearDown];
    _sut.delegate = nil;
    _sut = nil;
}

#pragma mark KIIMagePager DataSource
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
    return _imageArray;
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFill;
}

#pragma mark - Test Methods
- (void) testKIImagePagerTakesImagesFromNSArray
{
    _imageArray = [[NSArray alloc] initWithObjects:
                   [UIImage imageNamed:@"KICamera"],
                   nil];
    STAssertNoThrow([_sut initialize], nil);
}

- (void) testKIImagePagerTakesImagesFromNSMutableArray
{
    _imageArray = [[NSMutableArray alloc] initWithObjects:
                   [UIImage imageNamed:@"KICamera"],
                   nil];
    STAssertNoThrow([_sut initialize], nil);
}

@end
