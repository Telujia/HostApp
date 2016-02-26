//
//  FloatingViewInterface.h
//  FloatingView
//
//  Created by lucaiguang on 16/2/26.
//  Copyright © 2016年 Chazz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FloatingViewShowEventNone,
    FloatingViewShowEventShake,
    FloatingViewShowEventScreenshot,
    FloatingViewShowEventTwoFingersSwipeLeft,
    FloatingViewShowEventRightEdgePan,
    FloatingViewShowEventFloatingButton
} FloatingViewShowEventType;

@interface FloatingViewInterface : NSObject

+ (void)showWithToken:(NSString *)token eventType:(FloatingViewShowEventType)eventType;

@end
