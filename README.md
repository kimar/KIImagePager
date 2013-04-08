## KIImagePager

This UIView Subclass is used to present Images loaded from the Web and is inspired from foursquare's Image Slideshow. For asyn load of the Images SDWebImage is used, this has been addded as a git Submodule. To initialize and checkout this Submodule after you clone the KIImagePager repository please do the following:

```objective-c
git submodule update --init --recursive
```

Implementing the ImagePager is fairly easy, just set it up in Interface Builder:
![Setup in Interface Builder](http://kimar.github.io/screenshots/kiimagepager/ibsetup.png)

Optionally customize the PageControl's appearance:

```objective-c
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
}
```

Now implement it's DataSource and (optionally) Delegate methods:

```objective-c
- (NSArray *) arrayWithImageUrlStrings
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
```

This is how it looks like, after you've set it up:

![While loading the Image](http://kimar.github.io/screenshots/kiimagepager/1.png)
![After loading the Image](http://kimar.github.io/screenshots/kiimagepager/2.png)