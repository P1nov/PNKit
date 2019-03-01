//
//  PNRowAction.m
//  PNKit
//
//  Created by wefint on 2019/3/1.
//

#import "PNRowAction.h"

@implementation PNRowActionConfig

+ (PNRowActionConfig *)configWithTitle:(NSString *)title icon:(UIImage *)icon font:(UIFont *)font color:(UIColor *)color{

    PNRowActionConfig *config = [[PNRowActionConfig alloc] init];

    config.title = title;
    config.icon = icon;
    config.font = font;
    config.color = color;

    return config;
}

@end

@implementation PNRowAction

+ (PNRowAction *)actionWithConfig:(PNRowActionConfig *)config handler:(PNRowActionHandler)handler{

    PNRowAction *action = [[PNRowAction alloc] init];

    action->_config = config;
    action->_handler = handler;

    return action;
}

@end
