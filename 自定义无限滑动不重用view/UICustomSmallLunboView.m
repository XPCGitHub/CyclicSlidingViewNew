//
//  UICustomSmallLunboView.m
//  IOSFramework
//
//  Created by xpc on 2017/1/9.
//  Copyright © 2017年 allianture. All rights reserved.
//
/*根据tag值来判断图片等位置，点几的图片*/
/*采用最后一张图片，数组图片，第一张图片，的结构*/

#import "UICustomSmallLunboView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIColor+Extension.h"
#import "SmallLunboView.h"
#import "AppDelegate.h"
/* 图片的坐标大小  */
//#define imageCellW         SCREEN_WIDTH //cell的宽
//#define imageCellW         SCREEN_WIDTH * 0.373 //cell的宽
//#define imageCellH        SCREEN_WIDTH * 0.213 //cell的高
#define imageCellW         SCREEN_WIDTH * 0.3 //cell的宽
#define imageCellH         SCREEN_AUTOMIC_SMALL_HIGHT * 110/456 //cell的高


#define imageCellWW         SCREEN_WIDTH * 0.395 //cell的宽
#define imageCellHH        SCREEN_WIDTH * 0.253 //cell的高

//@interface UICustomPageController (private)
//
//@property (nonatomic, strong)SmallLunboView *lunboCellView;
//
///* 请求图片 */
////- (void)getImage:(UIImageView *)imageview Number:(NSInteger)number;
//@end


@implementation UICustomSmallLunboView

static const NSUInteger startTag = 11011;//初始tag值


- (UIScrollView *)myScrollView {
    
    if (_myScrollView == nil) {
        
        _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];    //scrollView的大小
//        _myScrollView.backgroundColor = [UIColor redColor];
        //        _myScrollView.pagingEnabled=YES;//以页为单位滑动，即自动到下一页的开始边界
        _myScrollView.showsVerticalScrollIndicator=NO;
        _myScrollView.showsHorizontalScrollIndicator=NO;//隐藏垂直和水平显示条
        _myScrollView.delegate=self;
        
        [_myScrollView setContentSize:CGSizeMake(imageCellW*(self.imageArray.count+1)*2, imageCellH)];
            //        [_myScrollView scrollRectToVisible:CGRectMake(imageCellW, 0, imageCellW, imageCellH) animated:NO];
        [_myScrollView scrollRectToVisible:CGRectMake(imageCellW, 0, SCREEN_WIDTH, self.frame.size.height) animated:NO];
        
        
        [self addSubview:_myScrollView];
    }
    return _myScrollView;
}

/* 初始化 */

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageArray = [[NSMutableArray alloc] init];
    }
    return self;
}



/* 根据数据源，布局页面*/
- (void)reloadLectureDataArray:(NSArray *)imageUrlArr {
    
    if (self.imageArray.count > 0)
    {
        [self.imageArray removeAllObjects];
    }
    
    /* 对数据的各种情况进行判断 */
    if (imageUrlArr == nil)
    {
        NSDictionary *picDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"", @"url",
                                nil];
        NSArray *picArr = [NSArray arrayWithObject:picDic];
        [self.imageArray addObjectsFromArray:picArr];
    }
    else
    {
        [self.imageArray addObjectsFromArray:imageUrlArr];
    }
    
    /* 创建scroller和pageControl */
    [self configScrollView];
    
}

/* 创建scroller*/
-(void)configScrollView {
    
    /* 拖动属性 */
    if (self.imageArray.count < 1) {
        
        self.myScrollView.scrollEnabled = NO;
    }else {
        
        self.myScrollView.scrollEnabled = YES;
    }
    
   
        
        [self createSmallLunboView:CGRectMake(0, 0, imageCellW, imageCellH) No:self.imageArray.count -1];
        //    SmallLunboView *firstView = [[SmallLunboView alloc] initWithFrame:CGRectMake(0, 0, imageCellW, imageCellH)];
        //    firstView.imageLinkUrlStr = [self getImageWithNumber:self.imageArray.count -1];
        //    [self.myScrollView addSubview:firstView];
        
        /*2、添加数组图片,由于图片较小，放两遍*/
        for (int j = 0; j < 2; j++) {
            
            for (int i=0; i<[self.imageArray count]; i++) {
                
                //                 TITLog(@"cell position:%f", imageCellW + (imageCellW * self.imageArray.count * j) + imageCellW * i);
                [self createSmallLunboView:CGRectMake(imageCellW + (imageCellW * self.imageArray.count * j) + imageCellW * i, 0, imageCellW, imageCellH) No:i];
                //            SmallLunboView *subView = [[SmallLunboView alloc] initWithFrame:CGRectMake(imageCellW + (imageCellW * self.imageArray.count * j) + imageCellW * i, 0, imageCellW, imageCellH)];
                //            subView.imageLinkUrlStr = [self getImageWithNumber:i];
                //            [self.myScrollView addSubview:subView];
            }
        }
        
        /*3、最后再把数组第一张图片加上去*/
        
        [self createSmallLunboView:CGRectMake(imageCellW*(self.imageArray.count*2+1), 0, imageCellW, imageCellH) No:0];
        //    SmallLunboView *lastView = [[SmallLunboView alloc] initWithFrame:CGRectMake(imageCellW*(self.imageArray.count*2+1), 0, imageCellW, imageCellH)];
        //    lastView.imageLinkUrlStr = [self getImageWithNumber:0];
        //    [self.myScrollView addSubview:lastView];
    
    
    
}

- (void)createSmallLunboView:(CGRect)rect No:(NSInteger)num {
    
    //    NSLog(@"createSmallLunboView:%f-%f", rect.origin.x, rect.size.width);
        SmallLunboView *subView = [[SmallLunboView alloc] initWithFrame:rect];
        
        TreasureProductInfoModel *imgModel = [[TreasureProductInfoModel alloc]init];
        if (num < [self.imageArray count]) {
            
            imgModel = [self.imageArray objectAtIndex:num];
        }
    subView.cellModel = imgModel;
        __weak typeof(self)weakSelf  = self;
        [subView setImageBtnCLickblock:^() {
            
            weakSelf.imgBtnClickBlock(num);
        }];
        [self.myScrollView addSubview:subView];
}


#pragma UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.imageArray.count < 1) {
        return;
    }
    //    CGFloat decelerate = scrollView.decelerationRate;
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    
        if (currentOffsetX <= 10.0) {
            
            //            TITLog(@"currentOffsetX <= 10.0:%f", imageCellW * self.imageArray.count);
            [_myScrollView scrollRectToVisible:CGRectMake(imageCellW * self.imageArray.count + currentOffsetX, 0, SCREEN_WIDTH, self.frame.size.height) animated:NO];
        }else if (currentOffsetX >= imageCellW * ( self.imageArray.count * 2 + 2 ) - SCREEN_WIDTH - 10) {
            
            //            TITLog(@"currentOffsetX >= imageCellW:%f", imageCellW * (self.imageArray.count + 2)-SCREEN_WIDTH);
            [_myScrollView scrollRectToVisible:CGRectMake(imageCellW * (self.imageArray.count + 2)-SCREEN_WIDTH - 10, 0, SCREEN_WIDTH, self.frame.size.height) animated:NO];
        }
}


@end
