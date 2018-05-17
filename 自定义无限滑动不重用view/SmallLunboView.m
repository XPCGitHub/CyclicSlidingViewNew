//
//  SmallLunboView.m
//  IOSFramework
//
//  Created by xpc on 2017/1/9.
//  Copyright © 2017年 allianture. All rights reserved.
//

#import "SmallLunboView.h"
#import "DMDeviceInfomation.h"
#import "Masonry.h"

@interface SmallLunboView ()
{
    CGFloat bigFont;
    CGFloat normalFont;
    CGFloat smallFont;
}
@end

@implementation SmallLunboView
- (void)creatUI{
    self.imgViewBtn = [[UIButton alloc]init];
    [self addSubview:self.imgViewBtn];
    //快速投资
    [self.imgViewBtn setImage:[UIImage imageNamed:@"investment"] forState:UIControlStateNormal];
    [self.imgViewBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.imgViewBtn setAdjustsImageWhenHighlighted:NO];
    
    self.topLabel = [[UILabel alloc]init];
//    self.topLabel.textColor = COLOR_WORD;
//    self.topLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topLabel];
    self.bottomLabel = [[UILabel alloc]init];
//    self.bottomLabel.backgroundColor = [UIColor whiteColor];
//    self.bottomLabel.textColor = COLOR_WORD_UN;
    [self addSubview:self.bottomLabel];
    self.titleLabel = [[UILabel alloc]init];
//    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.textColor = [UIColor colorWithRed:255.0f/255.0f green:68.0f/255.0f blue:68.0f/255.0f alpha:1.0];
    [self addSubview:self.titleLabel];
}

- (void)masonryMyUI{
    [self.imgViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
        make.top.mas_equalTo(100);
    }];
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.mas_equalTo(50);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(50);
    }];
}

- (void)setCellModel:(TreasureProductInfoModel *)cellModel{
    _cellModel = cellModel;
    self.topLabel.text = cellModel.periods;
    self.titleLabel.text = [NSString stringWithFormat:@"%@%%",cellModel.predictAnnualizedRate];
    
    float planRaise = cellModel.planRaiseAmount.floatValue;
    if (!cellModel.planRaiseAmount || [cellModel.planRaiseAmount isEqualToString:@""] || planRaise <= 0) {
        self.titleLabel.textColor = [UIColor grayColor];
    }else{
        self.titleLabel.textColor = [UIColor colorWithRed:255.0f/255.0f green:68.0f/255.0f blue:68.0f/255.0f alpha:1.0];
    }    
    self.bottomLabel.text = cellModel.saleStartTime;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self getSubUIFont];
        [self creatUI];
    }
    return self;
}

- (void)getSubUIFont {
    NSString *_phoneType = [DMDeviceInfomation phoneType];
    if (iPhone4s || iPhone4 || [_phoneType isEqualToString:@"iPhone 4s"] || iPad3_4_mini2_air || iPad1_2_mini || iPadPro || [_phoneType hasPrefix:@"iPad"]){
        bigFont = 17;
        normalFont = 13;
        smallFont = 10;
    }else if (iPhone5 || iPhone5s  ||[_phoneType isEqualToString:@"iPhone 5"] || [_phoneType isEqualToString:@"iPhone 5c"]|| [_phoneType isEqualToString:@"iPhone 5s"] || [_phoneType isEqualToString:@"iPhone SE"]){
        bigFont = 17;
        normalFont = 13;
        smallFont = 10;
    }else if (iPhone6 || [_phoneType isEqualToString:@"iPhone 6"] || [_phoneType isEqualToString:@"iPhone 6s"]){
        bigFont = 21;
        normalFont = 14;
        smallFont = 10;
    }else {
        bigFont = 21;
        normalFont = 14;
        smallFont = 12;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.font = [UIFont systemFontOfSize:bigFont+5];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:normalFont+1];
    self.bottomLabel.font = [UIFont systemFontOfSize:smallFont];
    [self masonryMyUI];
}

- (void)imageBtnClick:(id)sender {
    self.imageBtnCLickblock();
}


@end
