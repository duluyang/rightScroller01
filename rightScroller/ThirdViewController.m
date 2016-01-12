//
//  ThirdViewController.m
//  rightScroller
//
//  Created by 杜露阳 on 16/1/7.
//  Copyright © 2016年 杜露阳. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIScrollView+allowPangesture.h"
#import "UINavigationController+ios7Support.h"

@interface ThirdViewController ()
@property (nonatomic,strong)UIScrollView *scrollerView;
@end


@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 400)];
    _scrollerView.contentSize = CGSizeMake(640, 400);
    _scrollerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_scrollerView];
    
    
     UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = self.navigationController.screenEdgePanGestureRecognizer;
   

    [_scrollerView.panGestureRecognizer requireGestureRecognizerToFail:screenEdgePanGestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
