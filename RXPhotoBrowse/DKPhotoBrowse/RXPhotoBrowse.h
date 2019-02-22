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
//  DKPhotoBrowseView.h
//  DookayProject
//
//  Created by dookay_73 on 2018/12/29.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXPhotoBrowse : UIView

//图片数组
@property (nonatomic, strong) NSArray *imgSourceArray;
//当前显示的index
@property (nonatomic, assign) NSInteger index;
//滑动停止的回调
@property (nonatomic, copy) void (^scrollViewEndBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
