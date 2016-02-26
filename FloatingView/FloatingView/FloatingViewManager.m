//
//  FloatingViewManager.m
//  FloatingView
//
//  Created by lucaiguang on 16/2/26.
//  Copyright © 2016年 Chazz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatingViewManager.h"
#import "FloatingViewController.h"

@interface FloatingViewManager ()

@property (nonatomic, strong) UIWindow *userWindow;

@property (nonatomic, strong) UIWindow *floatingWindow;

@end

@implementation FloatingViewManager

static FloatingViewManager *_instance;

+ (void)load {
    _instance = [[FloatingViewManager alloc] init];
}

+ (FloatingViewManager *)shareInstance {
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (!_instance) {
        _instance = [super allocWithZone:zone];
    }
    return _instance;
}

- (UIWindow *)floatingWindow {
    if (!_floatingWindow) {
        _floatingWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _floatingWindow.rootViewController = [[FloatingViewController alloc] init];
        [_floatingWindow makeKeyAndVisible];
    }
    return _floatingWindow;
}


@end
