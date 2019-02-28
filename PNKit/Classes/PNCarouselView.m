//
//  PNCarouselView.m
//  PNImageCarouselView
//
//  Created by wefint on 2019/2/28.
//  Copyright © 2019 leiyonglin. All rights reserved.
//

#import "PNCarouselView.h"

@interface PNCarouselView ()<UIScrollViewDelegate>{

    CGFloat _startDragingOffsetX;
}

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic) NSTimer *timer;

@end

@implementation PNCarouselView

- (instancetype)initWithFrame:(CGRect)frame carouselTime:(CGFloat)time{

    self = [super initWithFrame:frame];

    if(self){

        _carouselTime = time;
    }

    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{

    [self initialize];

    [self pn_updateImageInView];

}

- (void)initialize{

    _currentIndex = 0;
    _images = [NSMutableArray array];

    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;

    [self addSubview:self.scrollView];

    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 30.f, self.frame.size.width, 30.f)];
    _pageControl.currentPage = _currentIndex;
    _pageControl.pageIndicatorTintColor = self.normalImagePageControlColor ? : [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = self.currentImagePageControlColor ? : [UIColor redColor];

    [self insertSubview:_pageControl aboveSubview:_scrollView];
}

- (NSInteger)numberofImages{

    return [self.imageDatasource numberOfImageInCarouselView];;
}

- (UIImage *)imageInIndex:(NSInteger)index{

    return [self.imageDatasource carouselViewImageInEachIndex:index];
}

- (void)pn_updateImageInView{

    NSInteger count = [self numberofImages];

    self.scrollView.contentSize = CGSizeMake(count * self.frame.size.width, 0);

    for (NSInteger index = 0; index < count; index ++) {

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        UIImage *image = [self imageInIndex:index];
        imageView.image = image;
        imageView.tag = index;
        imageView.userInteractionEnabled = _isEnable ? : NO;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.scrollView action:@selector(didSelectImageView:)]];

        [self.scrollView addSubview:imageView];

        [_images addObject:image];

    }

    self.pageControl.numberOfPages = count;

    _timer = [NSTimer scheduledTimerWithTimeInterval:_carouselTime target:self selector:@selector(nextImage) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _startDragingOffsetX = scrollView.contentOffset.x;
    [_timer invalidate];
    _timer = nil;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if(scrollView.contentOffset.x != _startDragingOffsetX){

        if(_currentIndex < _images.count - 1 && _currentIndex >= 0){
            if(scrollView.contentOffset.x > _currentIndex * self.frame.size.width){
                _currentIndex ++;
            }else{
                if(_currentIndex > 0){
                    _currentIndex --;
                }
            }
        }
    }


    self.pageControl.currentPage = _currentIndex;

    _timer = [NSTimer scheduledTimerWithTimeInterval:_carouselTime target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage{

    if (_currentIndex < _images.count - 1) {
        _currentIndex ++;
    }else if(_currentIndex == _images.count - 1){
        _currentIndex = 0;
    }

    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.scrollView setContentOffset:CGPointMake(strongSelf->_currentIndex * strongSelf.frame.size.width, 0.f)];
    } completion:^(BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.pageControl.currentPage = strongSelf->_currentIndex;
    }];
}

- (void)didSelectImageView:(UITapGestureRecognizer *)tap{

    NSInteger tag = tap.view.tag;

    if([self.imageDelegate respondsToSelector:@selector(didSelectImageWithIndex:)]){
        [self.imageDelegate didSelectImageWithIndex:tag];
    }else{
        return ;
    }

}

@end
