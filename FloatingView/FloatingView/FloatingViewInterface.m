//
//  FloatingViewInterface.m
//  FloatingView
//
//  Created by lucaiguang on 16/2/26.
//  Copyright © 2016年 Chazz. All rights reserved.
//

#import "FloatingViewInterface.h"
#import "FloatingViewManager.h"

@implementation FloatingViewInterface

+ (id)getInstance {
    return [[FloatingViewManager alloc] init];
}

+ (void)showWithToken:(NSString *)token eventType:(FloatingViewShowEventType)eventType {
    FloatingViewManager *manager = [FloatingViewManager shareInstance];
    manager.eventType = 0;
}

@end
