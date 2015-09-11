//
//  HSDeviceAlarmModel.h
//  YHBubbleDemo
//
//  Created by Christ on 15/9/11.
//  Copyright (c) 2015年 Christ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HSShowMsgType) {
    HSShowMsgTypeHud = 0,
    HSShowMsgTypeAlert,
};

@interface HSDeviceAlarmModel : NSObject

@property (copy, nonatomic) NSString *alertMsg;

@property (copy, nonatomic) NSString *detectorName;

@property (assign, nonatomic) HSShowMsgType showMsgType;

@end
