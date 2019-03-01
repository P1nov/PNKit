//
//  PNPopoverView.m
//  PNKit
//
//  Created by wefint on 2019/3/1.
//

#import "PNPopoverView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface PNPopoverView ()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) PNArrowDirection direction;

@end

@implementation PNPopoverView

- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width direction:(PNArrowDirection)direction{

    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    if(self){

        _width = width;
        _origin = origin;
        _direction = direction;

        [self initialize];
    }

    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{

    [self pn_updatePopoverView];
}

- (void)drawRect:(CGRect)rect{

    CGContextRef context = UIGraphicsGetCurrentContext();

    if(_direction == PNArrowDirectionLeftUp || _direction == PNArrowDirectionLeftMiddle || _direction == PNArrowDirectionLeftDown){

        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);

    }

    if(_direction == PNArrowDirectionUpLeft || _direction == PNArrowDirectionUpMiddle || _direction == PNArrowDirectionUpRight){

        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY+5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    }

    if(_direction == PNArrowDirectionRightUp || _direction == PNArrowDirectionRightMiddle || _direction == PNArrowDirectionRightDown){

        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);

    }

    if(_direction == PNArrowDirectionDownLeft || _direction == PNArrowDirectionDownMiddle || _direction == PNArrowDirectionDownRight){

        CGFloat startX = self.origin.x;
        CGFloat startY = self.origin.y;
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY-5);
    }

    CGContextClosePath(context);
    [self.backView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)initialize{

    _rowHeight = 40.f;
    _rowActions = [NSMutableArray array];

    self.backgroundColor = UIColor.clearColor;
}

- (void)pn_updatePopoverView{

    _height = _rowHeight * self.rowActions.count;

    self.backView=[[UIView alloc]initWithFrame:CGRectMake(_origin.x, _origin.y, _width, _height)];
    self.backView.backgroundColor=[UIColor colorWithWhite:0.2 alpha:1];
    self.backView.clipsToBounds = YES;
    self.backView.layer.cornerRadius = 2.f;
    [self addSubview:self.backView];

    for (NSInteger index = 0; index < self.rowActions.count; index ++) {

        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, index * _rowHeight, _width, _rowHeight)];
        [button setTitle:self.rowActions[index].config.title forState:UIControlStateNormal];
        [button setImage:self.rowActions[index].config.icon forState:UIControlStateNormal];
        [button setTitleColor:self.rowActions[index].config.color ? : UIColor.whiteColor forState:UIControlStateNormal];
        button.titleLabel.font = self.rowActions[index].config.font ? : [UIFont systemFontOfSize:14.f];
        button.tag = index;
        button.backgroundColor = UIColor.clearColor;
        [button addTarget:self action:@selector(handlerFrom:) forControlEvents:UIControlEventTouchUpInside];

         [self.backView addSubview:button];
    }
}

- (void)handlerFrom:(UIButton *)button{

    self.rowActions[button.tag].handler(self.rowActions[button.tag]);
}

- (void)popView{

    NSArray *subviews = [self.backView subviews];
    for (UIView *view in subviews) {

        view.hidden = YES;
    }

    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;

    if (_direction == PNArrowDirectionLeftUp) {
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y - 20, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionLeftMiddle){

        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y - self.height / 2, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionLeftDown){

        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y - self.height / 2 - 20, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction == PNArrowDirectionUpLeft){

        self.backView.frame = CGRectMake(self.origin.x, self.origin.y + 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 20, self.origin.y + 5, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionUpMiddle){

        self.backView.frame = CGRectMake(self.origin.x, self.origin.y + 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - self.width / 2, self.origin.y + 5 , self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionUpRight){

        self.backView.frame = CGRectMake(self.origin.x, self.origin.y + 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 20 - self.width / 2, self.origin.y + 5, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionRightUp){

        self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y - 20, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionRightMiddle){

        self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y - self.height / 2, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionRightDown){

        self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 5, self.origin.y - 20 - self.height / 2, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if(_direction == PNArrowDirectionDownLeft){

        self.backView.frame = CGRectMake(self.origin.x , self.origin.y - 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 20, self.origin.y - 5, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];

    }else if(_direction == PNArrowDirectionDownMiddle){

        self.backView.frame = CGRectMake(self.origin.x , self.origin.y - 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - self.width / 2, self.origin.y - 5, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];


    }else if(_direction == PNArrowDirectionDownRight){

        self.backView.frame = CGRectMake(self.origin.x , self.origin.y - 5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.backView.frame = CGRectMake(self.origin.x - 20 - self.width / 2, self.origin.y - 5, self.width, self.height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.backView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }
}

-(void)dismiss{

    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        [view removeFromSuperview];
    }

    //动画效果淡出
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}


@end
