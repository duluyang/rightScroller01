//
//  UIScrollView+allowPangesture.m
//  rightScroller
//
//  Created by 杜露阳 on 16/1/8.
//  Copyright © 2016年 杜露阳. All rights reserved.
//

#import "UIScrollView+allowPangesture.h"

@implementation UIScrollView (allowPangesture)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    NSLog(@"%@---%@",[gestureRecognizer class],[otherGestureRecognizer class]);
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]])
    {
        return YES;
    }
    else
    {
        return  NO;
    }
}


@end
