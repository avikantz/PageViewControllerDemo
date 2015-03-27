//
//  PageRootViewController.h
//  PageViewControllerDemo
//
//  Created by Avikant Saini on 3/27/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface PageRootViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) id data;

- (void)playIntro;

@end
