//
//  UICustomSmallLunboView.h
//  IOSFramework
//
//  Created by xpc on 2017/1/9.
//  Copyright © 2017年 allianture. All rights reserved.
//

#import <UIKit/UIKit.h>

//当前设备的屏幕宽度
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_AUTOMIC_SMALL_HIGHT ([UIScreen mainScreen].bounds.size.height - 64 - 48)
@interface UICustomSmallLunboView : UIView<UIScrollViewDelegate>
//{
//    NSMutableArray *imageArray;//存放图片
//    NSInteger nowPageNumber;
//}

@property(nonatomic,strong) UIScrollView *myScrollView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, copy)void (^imgBtnClickBlock)(NSInteger whichImagePage);//点击图片，显示详情

/* 刷新数据 */
- (void)reloadLectureDataArray:(NSArray *)imageUrlArr;
@end
