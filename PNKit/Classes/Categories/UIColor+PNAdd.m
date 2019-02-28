//
//  UIColor+PNAdd.m
//  PNKit
//
//  Created by wefint on 2019/2/28.
//

#import "UIColor+PNAdd.h"

@implementation UIColor (PNAdd)

+ (UIColor *)f3Color{

    return [UIColor colorWithRGB:0xf3f3f3];

}

+ (UIColor *)colorWithRGB:(unsigned int)hex{

    return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.f green:((hex & 0xFF00) >> 8) / 255.f blue:(hex & 0xFF) / 255.f alpha:1.f];
}

@end
