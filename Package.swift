// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

 let package = Package(
     name: "KIImagePager",
     platforms: [
         .iOS(.v8)
     ],
     products: [
         .library(
             name: "KIImagePager",
             targets: ["KIImagePager"])
     ],
     targets: [
         .target(
             name: "KIImagePager",
             path: "KIImagePager",
             sources: ["KIImagePager"],
             publicHeadersPath: "KIImagePager",
             cSettings: [
                 .headerSearchPath("KIImagePager")
             ]
         ),
         .testTarget(
            name: "KIImagePagerTests",
            dependencies: ["KIImagePager"],
            path: "KIImagePagerTests"
         ),
     ]
 )
