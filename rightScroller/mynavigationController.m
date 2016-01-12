//
//  mynavigationController.m
//  rightScroller
//
//  Created by 杜露阳 on 16/1/7.
//  Copyright © 2016年 杜露阳. All rights reserved.
//

#import "mynavigationController.h"

@interface mynavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@property(nonatomic,weak) UIViewController* currentShowVC;
@end

@implementation mynavigationController


+ (void)initialize
{
   
        [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
        
        // 1.获得bar对象
        UINavigationBar *navBar = [UINavigationBar appearance];
        
        // 2.1.设置bar背景
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
            
//        // 2.2.设置状态栏为黑色
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//    
//        
//        // 3.设置文字样式
//        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//        attrs[UITextAttributeTextColor] = [UIColor blackColor];
//        attrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
//        attrs[UITextAttributeFont] = [UIFont systemFontOfSize:20];
//        [navBar setTitleTextAttributes:attrs];
//        
//        // 4.设置导航栏按钮的主题
//        UIBarButtonItem *barItem = [UIBarButtonItem appearance];
//        
//        // 5.设置按钮的背景
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
//        
//        
//        // 6.设置按钮的文字样式
//        NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
//        itemAttrs[UITextAttributeTextColor] =  [UIColor orangeColor];
//        itemAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
//        [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
//        [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateHighlighted];
    
     [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
        
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if (viewController.navigationItem.leftBarButtonItem ==nil && self.viewControllers.count >1) {
        
        viewController.navigationItem.leftBarButtonItem = [self creatBackButton];
        
    }
}

-(UIBarButtonItem *)creatBackButton

{
//    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_background"] style:UIBarButtonItemStylePlaintarget:selfaction:@selector(popSelf)];
    
  return   [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    
}

-(void)popSelf
{
    [self popViewControllerAnimated:YES];
}


-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    mynavigationController* nvc = [super initWithRootViewController:rootViewController];
    self.interactivePopGestureRecognizer.delegate = self;
    nvc.delegate = self;
    return nvc;
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.viewControllers.count == 1)
        self.currentShowVC = Nil;
    else
        self.currentShowVC = viewController;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return (self.currentShowVC == self.topViewController); //the most important
    }
    return YES;
}

@end
