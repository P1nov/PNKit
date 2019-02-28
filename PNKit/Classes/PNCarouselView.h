//
//  PNCarouselView.h
//  PNImageCarouselView
//
//  Created by wefint on 2019/2/28.
//  Copyright © 2019 leiyonglin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PNCarouselViewDataSource <NSObject>

@required
- (NSInteger)numberOfImageInCarouselView;

- (UIImage *)carouselViewImageInEachIndex:(NSInteger)index;

@optional
- (void)updateImageAtIndex:(NSInteger)index;

@end

@protocol PNCarouselViewDelegate <NSObject>

@optional
- (void)didSelectImageWithIndex:(NSInteger)index;

@end

@interface PNCarouselView : UIView

@property (nonatomic, strong, readonly) NSMutableArray <UIImage *> *images;

@property (nonatomic, weak) id<PNCarouselViewDataSource> imageDatasource;
@property (nonatomic, weak) id<PNCarouselViewDelegate> imageDelegate;

- (instancetype)initWithFrame:(CGRect)frame carouselTime:(CGFloat)time;

//图片是否能点击
@property (nonatomic, assign) BOOL isEnable;
//轮播滚动间隔时间
@property (nonatomic, assign) CGFloat carouselTime;
//当前图片
@property (nonatomic, strong, readonly) UIImage *currentImage;
//当前第几张
@property (nonatomic, assign, readonly) NSInteger currentIndex;
//pageControl颜色
@property (nonatomic, strong) UIColor *currentImagePageControlColor;//默认为red
@property (nonatomic, strong) UIColor *normalImagePageControlColor;//默认为lightGray

@end

NS_ASSUME_NONNULL_END
