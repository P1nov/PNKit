# PNKit

[![CI Status](https://img.shields.io/travis/wefint/PNKit.svg?style=flat)](https://travis-ci.org/wefint/PNKit)
[![Version](https://img.shields.io/cocoapods/v/PNKit.svg?style=flat)](https://cocoapods.org/pods/PNKit)
[![License](https://img.shields.io/cocoapods/l/PNKit.svg?style=flat)](https://cocoapods.org/pods/PNKit)
[![Platform](https://img.shields.io/cocoapods/p/PNKit.svg?style=flat)](https://cocoapods.org/pods/PNKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PNKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PNKit'
```

## Author

wefint, 1473781785@qq.com. WeChat:Fyair000

## License

PNKit is available under the MIT license. See the LICENSE file for more info.

# Use
## PNCarouselView
Use like UITableView.
It has two protocol, you should implement two of those functions in where you used it

```ruby
- (NSInteger)numberOfImageInCarouselView;
- (UIImage *)carouselViewImageInEachIndex:(NSInteger)index;
```

### 这是一个轮播图的封装 可以直接使用 用法类似于UITableView

## UIColor (category)

there is a category fot UIColor, I turn the hex number for UIColor, so you can only use 
```ruby
+ (UIColor *)colorWithRGB:(unsigned int)hex;
```
to set color you want!
