//
//  UIScrollView+allowPangesture.h
//  rightScroller
//
//  Created by 杜露阳 on 16/1/8.
//  Copyright © 2016年 杜露阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (allowPangesture)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
@end
