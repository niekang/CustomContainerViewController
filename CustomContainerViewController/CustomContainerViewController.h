//
//  CustomContainerViewController.h
//  CustomContainerViewController
//
//  Created by niekang on 2018/10/16.
//  Copyright © 2018 xiangshang360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContainerViewController : UIViewController

@property(nonatomic, strong)NSArray<__kindof UIViewController *> *viewControllers;;
@property(nonatomic, assign)NSInteger selectedIndex;
@property(nonatomic, strong,readonly)UIViewController *selectedViewController;

- (instancetype)initWithViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers;

- (void)restoreSelectedIndex;
@end

