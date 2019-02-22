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
//  ViewController.m
//  RXPhotoBrowse
//
//  Created by dookay_73 on 2019/1/9.
//  Copyright © 2019 LU. All rights reserved.
//

#import "ViewController.h"
#import "RXPhotoBrowse.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    RXPhotoBrowse *browser = [[RXPhotoBrowse alloc] init];

    browser.imgSourceArray = @[@"http://img.mp.sohu.com/q_mini,c_zoom,w_640/upload/20170716/200efc42c1fc4004b434d08a3daa10ad_th.jpg",
                               @"http://bpic.ooopic.com/17/82/10/17821052-edfcca336499ea0f826687900d5a9291-3.jpg",
                               @"http://www.agri35.com/UploadFiles/img_0_526283932_40787768_26.jpg",
                               @"http://bpic.ooopic.com/17/22/42/17224220-4ca7ab2f57c24c13b05d6f03805058bd-2.jpg",
                               @"http://t-1.tuzhan.com/4f1aef2ebb99/c-2/l/2013/11/15/10/2e77aecc05e54dda9315e6515f3727f9.jpg",
                               @"http://5b0988e595225.cdn.sohucs.com/images/20180801/d3be86b6eb164087b164d3ea42bb8124.jpeg"];
    [self.view addSubview:browser];
    
//    WS(weakSelf);
    [browser setScrollViewEndBlock:^(NSInteger index) {
        NSLog(@"=========");
//        weakSelf.index = index;
//        weakSelf.numLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)weakSelf.dataArray.count];
//        if (!_isHidden) {
//            SearchImgModel *model = weakSelf.dataArray[index];
//            weakSelf.contentLabel.text = model.docName;
//        }
    }];
    [browser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


@end
