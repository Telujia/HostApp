//
//  FloatingViewController.m
//  FloatingView
//
//  Created by lucaiguang on 16/2/26.
//  Copyright © 2016年 Chazz. All rights reserved.
//

#import "FloatingViewController.h"

@interface FloatingViewController ()
@property (nonatomic, strong) UIView *maskView;
@end

@implementation FloatingViewController

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    }
    return _imageView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        _maskView.backgroundColor = [UIColor blueColor];
        _maskView.alpha = 0.6;
    }
    return _maskView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.maskView];
}

@end
