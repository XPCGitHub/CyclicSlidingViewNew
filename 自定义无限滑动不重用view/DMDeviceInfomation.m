//
//  DMDeviceInfomation.m
//  设备和应用信息
//
//  Created by xpc on 15/8/6.
//  Copyright (c) 2015年 sunajun. All rights reserved.
//

#import "DMDeviceInfomation.h"
#import <UIKit/UIKit.h>
#import <sys/sysctl.h>
#import "Macro.h"

@implementation DMDeviceInfomation
/**
 *  获取系统平台
 */
+ (NSString *)platform
{
    return [UIDevice currentDevice].model;
}

/**
 *  获取用户定义名称
 */
+ (NSString *)customName
{
    return [[UIDevice currentDevice] name];
}

/**
 *  获取系统名称
 */
+ (NSString *)systemName
{
    return [[UIDevice currentDevice] systemName];
}

/**
 *  获取系统版本
 */
+ (NSString *)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

/**
 *  获取设备类型
 */
+ (NSString *)phoneType
{
    return [self platformString];
}


/**
 *  获取应用唯一标识
 */
+ (NSString *)UDID
{
    NSString *udidStr=[[NSUserDefaults standardUserDefaults]objectForKey:kUDID];
    if (udidStr==nil) {
        udidStr=[[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [[NSUserDefaults standardUserDefaults]setObject:udidStr forKey:kUDID];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    return udidStr;
}

+ (NSString *) platformString{
    
    NSString *platform = [self getDeviceVersion];
    
    //apple watch
    if ([platform isEqualToString:@"Watch1,1"])   return@"Apple Watch";
    if ([platform isEqualToString:@"Watch1,2"])   return@"Apple Watch";
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])   return@"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])   return@"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])   return@"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])   return@"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])   return@"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])   return@"iPhone 4 (CDMA)";
    
    if ([platform isEqualToString:@"iPhone4,1"])   return @"iPhone 4s";
    if ([platform isEqualToString:@"iPhone5,1"])   return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])   return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])   return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])   return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])   return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])   return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone8,4"])   return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone7,2"])   return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])   return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone8,1"])   return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])   return @"iPhone 6s Plus";
    
    //iPot Touch
    if ([platform isEqualToString:@"iPod1,1"])     return@"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])     return@"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])     return@"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])     return@"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])     return@"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])     return@"iPod Touch 6G";
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])     return@"iPad";
    if ([platform isEqualToString:@"iPad2,1"])     return@"iPad 2(A1395)";
    if ([platform isEqualToString:@"iPad2,2"])     return@"iPad 2(A1396)";
    if ([platform isEqualToString:@"iPad2,3"])     return@"iPad 2(A1397)";
    if ([platform isEqualToString:@"iPad2,4"])     return@"iPad 2 New";
    if ([platform isEqualToString:@"iPad3,1"])     return@"iPad 3(A1416)";
    if ([platform isEqualToString:@"iPad3,2"])     return@"iPad 3(A1403)";
    if ([platform isEqualToString:@"iPad3,3"])     return@"iPad 3(A1430)";
    if ([platform isEqualToString:@"iPad3,4"])     return@"iPad 4(A1458)";
    if ([platform isEqualToString:@"iPad3,5"])     return@"iPad 4(A1459)";
    if ([platform isEqualToString:@"iPad3,6"])     return@"iPad 4(A1460)";
    if ([platform isEqualToString:@"iPad4,1"])     return@"iPad Air(A1474)";
    if ([platform isEqualToString:@"iPad4,2"])     return@"iPad Air(A1475)";
    if ([platform isEqualToString:@"iPad4,3"])     return@"iPad Air(A1476)";
    if ([platform isEqualToString:@"iPad5,3"])     return@"iPad Air2(A1566)";
    if ([platform isEqualToString:@"iPad5,4"])     return@"iPad Air2(A1567)";
    if ([platform isEqualToString:@"iPad6,7"])     return@"iPad Pro (12.9 inch)";
    if ([platform isEqualToString:@"iPad6,8"])     return@"iPad Pro (12.9 inch)";
    if ([platform isEqualToString:@"iPad6,3"])     return@"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,4"])     return@"iPad Pro (9.7 inch)";

    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])     return@"iPad Mini(A1432)";
    if ([platform isEqualToString:@"iPad2,6"])     return@"iPad Mini(A1454)";
    if ([platform isEqualToString:@"iPad2,7"])     return@"iPad Mini(A1455)";
    if ([platform isEqualToString:@"iPad4,4"])     return@"iPad mini2(A1489)";
    if ([platform isEqualToString:@"iPad4,5"])     return@"iPad mini2(A1490)";
    if ([platform isEqualToString:@"iPad4,6"])     return@"iPad mini2(A1491)";
    if ([platform isEqualToString:@"iPad4,7"])     return@"iPad mini3(A1599)";
    if ([platform isEqualToString:@"iPad4,8"])     return@"iPad mini3(A1600)";
    if ([platform isEqualToString:@"iPad4,9"])     return@"iPad mini3(A1601)";
    if ([platform isEqualToString:@"iPad5,1"])     return@"iPad mini4(A1538)";
    if ([platform isEqualToString:@"iPad5,2"])     return@"iPad mini4(A1550)";
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])        return@"Simulator";
    
    return platform;
}

+ (NSString*)getDeviceVersion
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"系统平台:%@,用户定义的名称:%@,系统名称:%@,系统版本:%@,设备型号:%@,应用唯一标识:%@",self.platform,self.customName,self.systemName,self.systemVersion,self.phoneType,self.UDID];
}
@end
