//
//  PNRowAction.h
//  PNKit
//
//  Created by wefint on 2019/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PNRowAction;

typedef void(^PNRowActionHandler)(PNRowAction *action);

@interface PNRowActionConfig : NSObject

@property (nonatomic, strong, nullable) UIImage *icon;
@property (nonatomic, copy, nonnull) NSString *title;
@property (nonatomic, strong, nullable) UIFont *font;
@property (nonatomic, strong, nullable) UIColor *color;

@end

@interface PNRowAction : NSObject

@property (nonatomic, readonly, strong) PNRowActionConfig *config;

@property (nonatomic, copy, readonly, nullable) PNRowActionHandler handler;

+ (PNRowAction *)actionWithConfig:(PNRowActionConfig *)config
                        handler:(PNRowActionHandler)handler;

@end

NS_ASSUME_NONNULL_END
