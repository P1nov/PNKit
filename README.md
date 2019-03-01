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

P1nov, 1473781785@qq.com. WeChat:Fyair000

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

there is a category for UIColor, I turn the hex number for UIColor, so you can only use 
```ruby
+ (UIColor *)colorWithRGB:(unsigned int)hex;
```
to set color you want!
### 这是一个UIColor的分类， 你可以直接使用RGB形式的数据设置颜色！

## PNPopoverView

It is a pop over view , you can use it for a pop list !

It has two object you must use : PNRowAction and PNRowActionConfig, you should add RowAction in the PNPopoverView and there is a block for click event.

```ruby
+ (PNRowAction *)actionWithConfig:(PNRowActionConfig *)config
                        handler:(PNRowActionHandler)handler;
```


The most useful thing is that you can set the arrow's direction

```ruby
typedef NS_ENUM(NSUInteger,PNArrowDirection){
    //箭头位置
    PNArrowDirectionLeftUp=1,//左上
    PNArrowDirectionLeftMiddle,//左中
    PNArrowDirectionLeftDown,//左下
    PNArrowDirectionRightUp,//右上
    PNArrowDirectionRightMiddle,//右中
    PNArrowDirectionRightDown,//右下
    PNArrowDirectionUpLeft,//上左
    PNArrowDirectionUpMiddle,//上中
    PNArrowDirectionUpRight,//上右
    PNArrowDirectionDownLeft,//下左
    PNArrowDirectionDownMiddle,//下中
    PNArrowDirectionDownRight,//下右

};
```

```ruby
 _popoverView = [[PNPopoverView alloc] initWithOrigin:CGPointMake(200, 300) width:100 direction:PNArrowDirectionUpRight];

    PNRowActionConfig *config1 = [PNRowActionConfig configWithTitle:@"title1" icon:nil font:nil color:nil];
    PNRowAction *action1 = [PNRowAction actionWithConfig:config1 handler:^(PNRowAction * _Nonnull action) {

        NSLog(@"第1个action");
    }];


    PNRowActionConfig *config2 = [PNRowActionConfig configWithTitle:@"title2" icon:nil font:nil color:nil];
    PNRowAction *action2 = [PNRowAction actionWithConfig:config2 handler:^(PNRowAction * _Nonnull action) {

        NSLog(@"第2个action");
    }];


    PNRowActionConfig *config3 = [PNRowActionConfig configWithTitle:@"title3" icon:nil font:nil color:nil];
    PNRowAction *action3 = [PNRowAction actionWithConfig:config3 handler:^(PNRowAction * _Nonnull action) {

        NSLog(@"第3个action");
    }];
    _popoverView.rowActions = [NSMutableArray arrayWithArray:@[action1, action2, action3]];
```

### 这是一个弹窗视图，你可以自定义箭头方向哦～


### I will update this pod in a long time, thanks for using it and star it please~
### 我会一直更新这个pod库， 谢谢你们的stars和使用哦～
