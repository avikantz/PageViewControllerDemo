//
//  PageContentViewController.m
//  PageViewControllerDemo
//
//  Created by Avikant Saini on 3/27/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "PageContentViewController.h"

#define SWidth self.view.frame.size.width
#define SHeight self.view.frame.size.height

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_titleLabel.alpha = 0.0;
	_subtitleLabel.alpha = 0.0;
	_iconImageView.alpha = 0.0;
	_titleLabel.transform = CGAffineTransformMakeTranslation(0, -10);
	_subtitleLabel.transform = CGAffineTransformMakeTranslation(0, 10);

	_titleLabel.text = _data[0];
	_subtitleLabel.text = _data[1];
	_iconImageView.image = [UIImage imageNamed:_data[3]];

	[UIView animateWithDuration:0.35 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
		_titleLabel.alpha = 1.0;
		_subtitleLabel.alpha = 1.0;
		_iconImageView.alpha = 1.0;
		_titleLabel.transform = CGAffineTransformIdentity;
		_subtitleLabel.transform = CGAffineTransformIdentity;
	} completion:nil];
}

-(void)viewDidLayoutSubviews {
	if (SWidth > SHeight)
		_iconImageView.hidden = YES;
	else
		_iconImageView.hidden = NO;
}

-(void)viewDidAppear:(BOOL)animated {
//	[UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//		_titleLabel.alpha = 0.0;
//		_subtitleLabel.alpha = 0.0;
//		_iconImageView.alpha = 0.0;
//		_titleLabel.transform = CGAffineTransformMakeTranslation(0, -10);
//		_subtitleLabel.transform = CGAffineTransformMakeTranslation(0, 10);
//		_iconImageView.transform = CGAffineTransformMakeScale(0.9, 0.9);
//	} completion:^(BOOL finished) {
//		_titleLabel.text = _data[0];
//		_subtitleLabel.text = _data[1];
//		_iconImageView.image = [UIImage imageNamed:_data[3]];
//		[UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//			_titleLabel.alpha = 1.0;
//			_subtitleLabel.alpha = 1.0;
//			_iconImageView.alpha = 1.0;
//			_titleLabel.transform = CGAffineTransformIdentity;
//			_subtitleLabel.transform = CGAffineTransformIdentity;
//			_iconImageView.transform = CGAffineTransformIdentity;
//		} completion:nil];
//	}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
