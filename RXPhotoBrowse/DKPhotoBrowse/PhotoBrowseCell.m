//
/*****************************************
 *                                       *
 *  @dookay.com Internet make it happen  *
 *  ----------- -----------------------  *
 *  dddd  ddddd Internet make it happen  *
 *  o   o     o Internet make it happen  *
 *  k    k    k Internet make it happen  *
 *  a   a     a Internet make it happen  *
 *  yyyy  yyyyy Internet make it happen  *
 *  ----------- -----------------------  *
 *  Say hello to the future.		     *
 *  hello，未来。                   	     *
 *  未来をその手に。                        *
 *                                       *
 *****************************************/
//
//  PhotoBrowseCell.m
//  DookayProject
//
//  Created by dookay_73 on 2018/12/29.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "PhotoBrowseCell.h"
#import <YYWebImage.h>

@interface PhotoBrowseCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation PhotoBrowseCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];
        
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"首页封面"]];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView.userInteractionEnabled = YES;
        [_scrollView addSubview:_imgView];
//        _imgView.yy_imageURL = [NSURL URLWithString:@"http://180.169.79.182:8081/pub//pictures/975C30HSTY1RO2520924_m.jpg"];
//        缩放处理
//        设置代理，设置最大最小缩放值
        _scrollView.delegate = self;
        _scrollView.minimumZoomScale = 0.5;
        _scrollView.maximumZoomScale = 3;
        
        if (@available(iOS 11.0, *)) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return self;
}

- (void)layoutSubviews
{
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = self.bounds.size;
    _imgView.frame = _scrollView.bounds;
}

- (void)setImgName:(NSString *)imgName
{
    _imgName = imgName;
    if (![imgName hasPrefix:@"http"]) {
//        imgName = [NSString stringWithFormat:@"%@%@", BASE_PIC_URL, imgName];
    }
    _imgView.yy_imageURL = [NSURL URLWithString:imgName];
}
#pragma mark - 缩放代理，必须
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat centerX = scrollView.center.x;
    CGFloat centerY = scrollView.center.y;

    centerX = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2:centerX;
    centerY = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2:centerY;

    _imgView.center = CGPointMake(centerX, centerY);
}
@end
