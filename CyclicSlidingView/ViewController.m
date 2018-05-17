//
//  ViewController.m
//  CyclicSlidingView
//
//  Created by xpc on 2018/4/2.
//  Copyright © 2018年 xpc. All rights reserved.
//

#import "ViewController.h"
#import "UICustomSmallLunboView.h"
#import "SmallLunboView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myVcInit];
    [self creatMyLunboView];
}

- (void)myVcInit{
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        TreasureProductInfoModel *model = [[TreasureProductInfoModel alloc]init];
        switch (i) {
            case 0:
                {
                    model.predictAnnualizedRate = @"37";
                    model.periods = @"长期";
                    model.planRaiseAmount = @"0";
                    model.saleStartTime = @"1";
                }
                break;
            case 1:
            {
                model.predictAnnualizedRate = @"75";
                model.periods = @"短期";
                model.planRaiseAmount = @"23";
                model.saleStartTime = @"2";
            }
                break;
            case 2:
            {
                model.predictAnnualizedRate = @"85";
                model.periods = @"中期";
                model.planRaiseAmount = @"0";
                model.saleStartTime = @"3";
            }
                break;
            case 3:
            {
                model.predictAnnualizedRate = @"97";
                model.periods = @"长期";
                model.planRaiseAmount = @"1237172817";
                model.saleStartTime = @"4";
            }
                break;
            default:
                break;
        }
        [self.dataArr addObject:model];
    }
    
}

- (void)creatMyLunboView{
    UICustomSmallLunboView *smallLunboView = [[UICustomSmallLunboView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_AUTOMIC_SMALL_HIGHT * 200/456)];
    smallLunboView.backgroundColor = [UIColor orangeColor];
    [smallLunboView reloadLectureDataArray:self.dataArr];
    smallLunboView.myScrollView.showsHorizontalScrollIndicator = NO;
    //    smallLunboView.imageArray = self.dataArr;
    smallLunboView.imgBtnClickBlock = ^(NSInteger whichImagePage) {
        if (self.dataArr.count > whichImagePage) {
            //跳转到web页面上
            TreasureProductInfoModel *smallMode = self.dataArr[whichImagePage];
            NSLog(@"%@",smallMode.saleStartTime);
        }
    };
    
    [self.view addSubview:smallLunboView];
}
@end
