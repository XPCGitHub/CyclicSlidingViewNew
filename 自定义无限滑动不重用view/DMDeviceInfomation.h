//
//  DMDeviceInfomation.h
//  设备和应用信息
//
//  Created by xpc on 15/8/6.
//  Copyright (c) 2015年 sunajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMDeviceInfomation : NSObject
/**
 *  系统平台
 */
@property(nonatomic,copy)NSString *platform;
/**
 *  用户定义名称
 */
@property(nonatomic,copy)NSString *customName;
/**
 *  系统名称
 */
@property(nonatomic,copy)NSString *systemName;
/**
 *  系统版本
 */
@property(nonatomic,copy)NSString *systemVersion;
/**
 *  设备类型
 */
@property(nonatomic,copy)NSString *phoneType;
/**
 *  应用唯一标识
 */
@property(nonatomic,copy)NSString *UDID;

/**
 *  获取系统平台
 */
+ (NSString *)platform;

/**
 *  获取用户定义名称
 */
+ (NSString *)customName;

/**
 *  获取系统名称
 */
+ (NSString *)systemName;

/**
 *  获取系统版本
 */
+ (NSString *)systemVersion;

/**
 *  获取设备类型
 */
+ (NSString *)phoneType;

/**
 *  获取应用唯一标识
 */
+ (NSString *)UDID;
@end
