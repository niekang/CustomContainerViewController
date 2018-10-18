//
//  ViewController.m
//  CustomContainerViewController
//
//  Created by niekang on 2018/10/16.
//  Copyright © 2018 xiangshang360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.label.superview) {
        self.label = [[UILabel alloc] init];
        self.label.text = self.title;
        [self.label sizeToFit];
        [self.view addSubview:self.label];
        
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    }
}


@end
