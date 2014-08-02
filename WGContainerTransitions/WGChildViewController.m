//
//  WGChildViewController.m
//  WGContainerTransitions
//
//  Created by 王刚 on 14/8/2.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "WGChildViewController.h"

@interface WGChildViewController ()
@property (strong, nonatomic) UILabel *privateTitleLabel;
@end

@implementation WGChildViewController

- (void)setTitle:(NSString *)title {
    self.title = title;
    [self _updateAppearance];
}
- (void)setThemeColor:(UIColor *)themeColor {
    _themeColor = themeColor;
    [self _updateAppearance];
}

- (void)loadView {
    
    self.privateTitleLabel = [[UILabel alloc]init];
    self.privateTitleLabel.backgroundColor = [UIColor clearColor];
    self.privateTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.privateTitleLabel.numberOfLines = 0;
    self.privateTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.privateTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.view = [[UIView alloc]init];
    [self.view addSubview:self.privateTitleLabel];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.privateTitleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
}


- (void)viewDidLoad
{
    self.privateTitleLabel.text = self.title;
    [self _updateAppearance];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_contenSizeCategoreDidChangeWithNotification:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}

- (void)dealloc {
    if ([self isViewLoaded]) {
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }
}


#pragma mark - private mthods
- (void)_updateAppearance {
    if ([self isViewLoaded]) {
        self.privateTitleLabel.text = self.title;
        self.view.backgroundColor = self.themeColor;
        self.view.tintColor = self.themeColor;
    }
}

- (void)_contenSizeCategoreDidChangeWithNotification:(NSNotification *)notification {
    self.privateTitleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [self.privateTitleLabel invalidateIntrinsicContentSize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
