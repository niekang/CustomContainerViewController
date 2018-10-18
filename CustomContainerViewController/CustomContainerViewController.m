//
//  CustomContainerViewController.m
//  CustomContainerViewController
//
//  Created by niekang on 2018/10/16.
//  Copyright © 2018 xiangshang360. All rights reserved.
//

#import "CustomContainerViewController.h"

#define TAB_WIDTH [UIScreen mainScreen].bounds.size.width
#define TAB_HEIGHT 49


@interface CustomContainerViewController ()

@property(nonatomic, strong)UIView *tabbar;
@property(nonatomic, strong)UIView *privateContainerView;
@property(nonatomic, strong)NSMutableArray *buttonTitles;


@end

@implementation CustomContainerViewController

- (instancetype)initWithViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    NSAssert(viewControllers && viewControllers.count > 0, @"viewControllers can't be nil or 0 element");
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _selectedIndex = NSNotFound;
        self.viewControllers = viewControllers;
        for (UIViewController *vc in viewControllers) {
            vc.view.translatesAutoresizingMaskIntoConstraints = YES;
            vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth |  UIViewAutoresizingFlexibleHeight;
            [self.buttonTitles addObject:vc.title ? vc.title : @""];
        }
    }
    return self;
}

- (void)loadView {
    UIView *rootView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    rootView.backgroundColor = [UIColor blackColor];
     self.view = rootView;
    _privateContainerView = [[UIView alloc] initWithFrame:rootView.bounds];
    _privateContainerView.backgroundColor = [UIColor blackColor];
    [rootView addSubview:_privateContainerView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tabbar];
    if (self.buttonTitles.count) {
        CGFloat width = TAB_WIDTH/self.buttonTitles.count;
        CGRect frame = CGRectMake(0, 0, width, TAB_HEIGHT);
        [self.buttonTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *title = (NSString *)obj;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectOffset(frame, idx*width, 0);
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];;
            [btn addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = idx;
            [self.tabbar addSubview:btn];
        }];
    }
}

#pragma mark - override
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.viewControllers && self.viewControllers.count && self.selectedIndex == NSNotFound) {
        self.selectedIndex = 0;
    }
}

#pragma mark - click
- (void)tabButtonClick:(UIButton *)btn {
    self.selectedIndex = btn.tag;
}

#pragma mark - private method
- (void)transitionViewControllerFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    if (self.viewControllers == nil || fromIndex == toIndex || fromIndex < 0 || toIndex < 0 || (fromIndex >= self.viewControllers.count && fromIndex != NSNotFound) || toIndex >= self.viewControllers.count) {
        return;
    }
    [self selectedTabButtonAtIndex:toIndex];
    UIViewController *selectedViewController = self.viewControllers[toIndex];
    [self addChildViewController:selectedViewController];
    [self.privateContainerView addSubview:selectedViewController.view];
    if (fromIndex == NSNotFound) {
        return;
    }
    UIViewController *fromViewController = self.viewControllers[fromIndex];
    [fromViewController.view removeFromSuperview];
    [fromViewController removeFromParentViewController];
}

- (void)selectedTabButtonAtIndex:(NSInteger)index {
    for (UIView *view in self.tabbar.subviews) {
        UIButton *btn = (UIButton *)view;
        if (btn.tag == index) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
    _selectedIndex = index;
}

- (void)restoreSelectedIndex {
    
}

#pragma mark - setter
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    [self transitionViewControllerFromIndex:_selectedIndex toIndex:selectedIndex];
}

#pragma mark - getter
- (NSMutableArray *)buttonTitles {
    if (!_buttonTitles) {
        _buttonTitles = [NSMutableArray array];
    }
    return _buttonTitles;
}

- (UIView *)tabbar {
    if (!_tabbar) {
        _tabbar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - TAB_HEIGHT, TAB_WIDTH, TAB_HEIGHT)];
    }
    return _tabbar;
}

- (UIViewController *)selectedViewController {
    if (self.viewControllers == nil || _selectedIndex < 0 || _selectedIndex >= self.viewControllers.count){
        return nil;
    }
    return self.viewControllers[_selectedIndex];
}


@end
