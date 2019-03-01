//
//  PNPopoverView.h
//  PNKit
//
//  Created by wefint on 2019/3/1.
//

#import <UIKit/UIKit.h>
#import "PNRowAction.h"

NS_ASSUME_NONNULL_BEGIN

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

@interface PNPopoverView : UIView

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, assign) CGFloat rowHeight;//行高，默认为40.f

@property (nonatomic, strong) NSMutableArray <PNRowAction *> *rowActions;

/**
 初始化箭头方向和origin和视图列表的宽度
 init the arrow's direction and origin and width of view

 @param origin <#origin description#>
 @param width <#width description#>
 @param direction <#direction description#>
 @return <#return value description#>
 */
- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width direction:(PNArrowDirection)direction;

- (void)popView;//弹出视图

- (void)dismiss;//视图消失

@end

NS_ASSUME_NONNULL_END
