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
//  DKPhotoBrowseView.m
//  DookayProject
//
//  Created by dookay_73 on 2018/12/29.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "RXPhotoBrowse.h"
#import "PhotoBrowseCell.h"

#define kPhotoBrowseCell  @"PhotoBrowseCell.h"

@interface RXPhotoBrowse()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation RXPhotoBrowse

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.collectionView];
        
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } 
    }
    
    return self;
}

- (void)layoutSubviews
{
    self.flowLayout.itemSize = self.bounds.size;
    self.collectionView.frame = self.bounds;
}
- (void)setImgSourceArray:(NSArray *)imgSourceArray
{
    _imgSourceArray = imgSourceArray;
}
- (void)setIndex:(NSInteger)index
{
    _index = index;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
#pragma mark - collection delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imgSourceArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoBrowseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoBrowseCell
                                                                      forIndexPath:indexPath];
    
    cell.imgName = _imgSourceArray[indexPath.item];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"=****************=%f", scrollView.contentOffset.x/mainWidth);
    NSInteger index = scrollView.contentOffset.x/self.collectionView.frame.size.width;
    if (self.scrollViewEndBlock) {
        self.scrollViewEndBlock(index);
    }
}
#pragma mark - getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        
        _collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[PhotoBrowseCell class]
            forCellWithReuseIdentifier:kPhotoBrowseCell];
    }
    return _collectionView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
