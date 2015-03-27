//
//  PageRootViewController.m
//  PageViewControllerDemo
//
//  Created by Avikant Saini on 3/27/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "PageRootViewController.h"

#define SWidth self.view.frame.size.width
#define SHeight self.view.frame.size.height

@interface PageRootViewController ()

@end

@implementation PageRootViewController {
	UISwipeGestureRecognizer *swipeDownGesture;
	UIButton *skipButton;
}

-(void)viewDidAppear:(BOOL)animated {
	[self playIntro];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_data = @[@[@"Stark",
				@"\"In a world this vulnerable, we need something more powerful than any of us.\"",
				@"IronMan.jpg",
				@"Icon01"],
			  @[@"Rogers",
				@"\"I'm sick of watching people pay for our mistakes.\"",
				@"CaptainAmerica.jpg",
				@"Icon02"],
			  @[@"Thor",
				@"\"You've meddeled with something you don't understand\"",
				@"Thor.jpg",
				@"Icon03"],
			  @[@"Hulk",
				@"\"That's my secret Cap, I'm always angry.\"",
				@"Hulk.jpg",
				@"Icon04"],
			  @[@"Ultron",
				@"\"I've got no strings to hold me down,\nto make me fret, or make me frown,\nI had strings, but now I'm free,\nThere are no strings on me!\"",
				@"Ultron.jpg",
				@"Icon05"]
			  ];
	
	swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
	[swipeDownGesture setNumberOfTouchesRequired:1];
	[swipeDownGesture setDirection:UISwipeGestureRecognizerDirectionDown];
	[swipeDownGesture setEnabled:YES];
	[swipeDownGesture setDelaysTouchesEnded:YES];
	[self.view addGestureRecognizer:swipeDownGesture];
	
	skipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[skipButton setFrame:CGRectMake(SWidth/2 - 100, SHeight - 80, 200, 44)];
	[skipButton setTitle:@"Frak This Shit!" forState:UIControlStateNormal];
	[skipButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:18.f]];
	[skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	skipButton.layer.borderWidth = 0.3f;
	skipButton.layer.cornerRadius = 12.f;
	skipButton.layer.borderColor = [UIColor whiteColor].CGColor;
	[skipButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

	if (!_backgroundImageView.image)
		_backgroundImageView.image = [UIImage imageNamed:[[_data objectAtIndex:0]objectAtIndex:2]];
	
	
}

-(void)swipeDown:(UISwipeGestureRecognizer *)recognizer {
	[UIView animateWithDuration:0.35 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		self.view.layer.transform = CATransform3DMakeTranslation(0, SHeight, 0);
	} completion:^(BOOL finished) {
		[self dismissViewControllerAnimated:NO completion:^{
		}];
	}];
}

#pragma mark - Page View Controller Datasource and Delegates

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
	NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
	if ((index == 0) || (index == NSNotFound))
		return nil;
	--index;
	return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
	NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
	if (index == NSNotFound)
		return nil;
	++index;
	if (index == [_data count])
		return nil;
	return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSInteger)index {
	if (([_data count] == 0) || (index > [_data count]))
		return nil;
	if (index == [_data count])
		return nil;
	
	PageContentViewController *pcvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentVC"];
	
	pcvc.data = [_data objectAtIndex:index];
	pcvc.pageIndex = index;
	
	return pcvc;
}

- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray *)pendingViewControllers {
	PageContentViewController *pcvc = [pendingViewControllers objectAtIndex:0];
	NSLog(@"Page Index : %li", pcvc.pageIndex);
	[UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		_backgroundImageView.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.9);
		_backgroundImageView.alpha = 0.7;
	} completion:^(BOOL finished) {
		_backgroundImageView.image = [UIImage imageNamed:[[_data objectAtIndex:pcvc.pageIndex]objectAtIndex:2]];
		[UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
			_backgroundImageView.layer.transform = CATransform3DIdentity;
			_backgroundImageView.alpha = 1.0;
		} completion:nil];
	}];
	if (pcvc.pageIndex == [_data count]) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
	return [_data count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
	return 0;
}

#pragma mark - Other Methods

- (void)playIntro {
	_pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageVC"];
	_pageViewController.dataSource = self;
	_pageViewController.delegate = self;
	
	PageContentViewController *initVC = [self viewControllerAtIndex:0];
	NSMutableArray *vcs = [NSMutableArray arrayWithObjects:initVC, nil];
	[_pageViewController setViewControllers:vcs direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
	[_pageViewController.view setFrame:self.view.bounds];
	[self addChildViewController:_pageViewController];
	[self.view addSubview:_pageViewController.view];
	[self.view addSubview:skipButton];
	[_pageViewController didMoveToParentViewController:self];
}

- (void)dismiss {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end