//
//  ViewController.h
//  PageViewControllerDemo
//
//  Created by Avikant Saini on 3/27/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)replayIntro:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *replayIntroButton;

@end

