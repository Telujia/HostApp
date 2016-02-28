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
#import <CoreMotion/CoreMotion.h>

@interface FloatingViewManager ()

@property (nonatomic, strong) UIWindow *currentWindow;

@property (nonatomic, strong) UIWindow *floatingWindow;

@property (nonatomic, strong) CMMotionManager *motion;

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

- (UIWindow *)currentWindow {
    if (!_currentWindow) {
        _currentWindow = [UIApplication sharedApplication].keyWindow;
    }
    return _currentWindow;
}

- (UIWindow *)floatingWindow {
    if (!_floatingWindow) {
        _floatingWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _floatingWindow.rootViewController = [[FloatingViewController alloc] init];
        [_floatingWindow makeKeyAndVisible];
    }
    return _floatingWindow;
}

- (CMMotionManager *)motion {
    if (!_motion) {
        _motion = [[CMMotionManager alloc] init];
        _motion.accelerometerUpdateInterval = .5f;
        
        if (!_motion.isAccelerometerAvailable) {
            NSLog(@"ERROR:motion error.");
        }
    }
    return  _motion;
}



- (void)setEventType:(NSUInteger)eventType {
    _eventType = eventType;
    
    switch (eventType) {
        case 0:{
            __weak typeof(self) weakself = self;
            [self.motion startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * accelerometerData, NSError * error) {
                double x = fabs(accelerometerData.acceleration.x);
                double y = fabs(accelerometerData.acceleration.y);
                double z = fabs(accelerometerData.acceleration.z);
                
                if (x > 2 || y > 2 || z > 2) {
                    [weakself.motion stopAccelerometerUpdates];
                    UIImage *image = [weakself screenshot];
                    FloatingViewController *floatingVC = (FloatingViewController *)self.floatingWindow.rootViewController;
                    floatingVC.imageView.image = image;
                    
                    NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
                    NSLog(@"%@", weakself.currentWindow);
                    NSLog(@"%@", weakself.floatingWindow);
                    //TODO:添加视图
                    NSLog(@"x:%f y:%f z:%f", x, y, z);
                }
            }];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - method
- (UIImage *)screenshot {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(self.currentWindow.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(self.currentWindow.bounds.size);
    
    [self.currentWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
