//
//  HSDeviceModel.m
//  YHBubbleDemo
//
//  Created by Christ on 15/9/11.
//  Copyright (c) 2015年 Christ. All rights reserved.
//

#import "HSDeviceModel.h"
#import "HSDeviceAlarmModel.h"

@implementation HSDeviceModel

- (void)parseAlartMsgWith:(NSString *)instruction
{
    HSShowMsgType showMsgType = HSShowMsgTypeHud;
    NSString *deviceInfo = [instruction substringWithRange:NSMakeRange(instruction.length-4, 4)];
    NSString *defenseId = [deviceInfo substringWithRange:NSMakeRange(0, 2)];
    
    NSString *detectorCode = [deviceInfo substringWithRange:NSMakeRange(3, 2)];
    
    NSString *detectorName = [self detectorNameWithDetectorCode:detectorCode];
    NSString *alarmMsg = [instruction substringWithRange:NSMakeRange(2,instruction.length-5-2)];
    
    if ([deviceInfo isEqualToString:@"0000"]) {
        showMsgType = HSShowMsgTypeAlert;
    } else if(defenseId.integerValue >= 1 && defenseId.integerValue <= 28 && detectorCode.integerValue >= 1 && detectorCode.integerValue <= 16) {
        showMsgType = HSShowMsgTypeAlert;
    } else if(defenseId.integerValue >= 0 && defenseId.integerValue <= 24  && detectorCode.integerValue == 42) {
        showMsgType = HSShowMsgTypeAlert;
    } else {
        showMsgType = HSShowMsgTypeHud;
    }
    
    HSDeviceAlarmModel *alertModel = [[HSDeviceAlarmModel alloc] init];
    alertModel.showMsgType = showMsgType;
    alertModel.alertMsg = alarmMsg;
    alertModel.detectorName = detectorName;
    
    //显示报警信息
    
}

#define HSLocalisze(str) NSLocalizedString(str, nil)

- (NSString *)detectorNameWithDetectorCode:(NSString *)detectorCode
{
    NSString *detectorName =@"";
    if (detectorCode.integerValue > 1 && detectorCode.integerValue < 16) {
        NSDictionary *detectorNames = @{@"01":HSLocalisze(@"燃气"),
                                        @"02":HSLocalisze(@"烟感"),
                                        @"03":HSLocalisze(@"玻璃"),
                                        @"04":HSLocalisze(@"震动"),
                                        @"05":HSLocalisze(@"窗磁"),
                                        @"06":HSLocalisze(@""),
                                        @"07":HSLocalisze(@""),
                                        @"08":HSLocalisze(@"紧急按钮"),
                                        @"09":HSLocalisze(@"水浸"),
                                        @"10":HSLocalisze(@"门磁"),
                                        @"11":HSLocalisze(@"红外"),
                                        @"12":HSLocalisze(@"燃气"),
                                        @"13":HSLocalisze(@"燃气"),
                                        @"14":HSLocalisze(@"燃气"),
                                        @"15":HSLocalisze(@"￼其他探测"),
                                        @"16":HSLocalisze(@"有线探测")};
        detectorName = detectorNames[detectorCode];
    }
    return detectorName;
}

@end
