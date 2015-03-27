//
//  ViewController.m
//  PageViewControllerDemo
//
//  Created by Avikant Saini on 3/27/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "ViewController.h"
#import "PageRootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
																	NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:22.0f]};
	self.navigationItem.title = @"Main View";
	[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
	[self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

-(void)viewDidAppear:(BOOL)animated {
	NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
	
	if ([navigationArray count] > 1)
		[navigationArray removeObjectAtIndex: 1];
	self.navigationController.viewControllers = navigationArray;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[_replayIntroButton setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor],
												  NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:22.0f]} forState:UIControlStateNormal];
	[_replayIntroButton setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor],
												  NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Medium" size:22.0f]} forState:UIControlStateHighlighted];
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"ShowIntro"])
		[self replayIntro:self];
	
}

-(IBAction)replayIntro:(id)sender {
	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ShowIntro"];
	PageRootViewController *prvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageRootVC"];
//	[self.navigationController pushViewController:prvc animated:YES];
	[self presentViewController:prvc animated:YES completion:nil];
}

@end
