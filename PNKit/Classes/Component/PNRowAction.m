//
//  PNRowAction.m
//  PNKit
//
//  Created by wefint on 2019/3/1.
//

#import "PNRowAction.h"

@implementation PNRowAction

+ (PNRowAction *)actionWithConfig:(PNRowActionConfig *)config handler:(PNRowActionHandler)handler{

    PNRowAction *action = [[PNRowAction alloc] init];

    action->_config = config;
    action->_handler = handler;

    return action;
}

@end
