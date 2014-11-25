## KIImagePager 

[![Platform Badge](https://cocoapod-badges.herokuapp.com/p/KIImagePager/badge.png)](https://cocoapod-badges.herokuapp.com/p/KIImagePager/badge.png) [![Version Badge](https://cocoapod-badges.herokuapp.com/v/KIImagePager/badge.png)](https://cocoapod-badges.herokuapp.com/v/KIImagePager/badge.png) [![Build Status](https://travis-ci.org/kimar/KIImagePager.png)](https://travis-ci.org/kimar/KIImagePager) [![License](https://go-shields.herokuapp.com/license-MIT-blue.png)](http://opensource.org/licenses/MIT)


### v2.1.0
***Please be aware that v2.0.0 broke some of the existing APIs, please check KIImagePagerDatasource before updating to the current Version!***

---

This UIView Subclass is used to present Images loaded from the Web and is inspired from foursquare's Image Slideshow. The used will be downloaded asynchronously. Former dependencies on SDWebImage have been removed.

This is what the ImagePager looks like when it's set up:

![Demo GIF Animation](http://kimar.github.io/screenshots/kiimagepager/demo.gif)

Implementing the ImagePager is fairly easy, just set it up in Interface Builder:
![Setup in Interface Builder](http://kimar.github.io/screenshots/kiimagepager/ibsetup_xcode5.png)

Optionally customize the PageControl's appearance:

```objective-c
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _imagePager.pageControlCenter = CGPointMake(CGRectGetWidth(_imagePager.frame) / 2, CGRectGetHeight(_imagePager.frame) - 42);
}
```

PageControl and ImageCounter can be hidden separately by setting ``imageCounterDisabled`` and ``imageCounterDisabled`` property. There is also a property ``hidePageControlForSinglePages``.

Now implement it's DataSource and (optionally) Delegate methods:

```objective-c
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
    return @[
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen1.png",
            [UIImage imageNamed:@"MySuperImage1"],
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen2.png",
            [UIImage imageNamed:@"MySuperImage2"],
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen3.png"
            ];
}
```

As you can see, it's now perfectly ok to mix urlStrings as well as UIImages inside *arrayWithImages* DataSource method.

```objective-c
- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager*)pager
{
    return UIViewContentModeScaleAspectFill;
}
```

Optionally you might define a caption title which will be shown above the images using the *captionForImageAtIndex* DataSource method.
```objective-c
- (NSString *) captionForImageAtIndex:(NSUInteger)index inPager:(KIImagePager*)pager
{
    return @[
             @"First screenshot",
             @"Another screenshot",
             @"Last one! ;-)"
             ][index];
}
```

If you'd like to get a SlideShow, just give it an interval for the time between those single slides:
```objective-c
_imagePager.slideshowTimeInterval = 1.5f;
```


**The MIT License (MIT)**

Copyright (c) 2013 Marcus Kida

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/kimar/kiimagepager/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

