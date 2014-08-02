//
//  WGContainerViewController.h
//  WGContainerTransitions
//
//  Created by 王刚 on 14/8/2.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

@import UIKit;
@import Foundation;

@protocol ContainerViewControllerDelegate;

@interface WGContainerViewController : UIViewController

@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;

@property (nonatomic, copy, readonly) NSArray *viewControllers;
@property (nonatomic, assign) UIViewController *selectedController;

- (instancetype)initWithViewController:(NSArray *)viewControllers;



@end

@protocol ContainerViewControllerDelegate <NSObject>

- (void)containerViewController:(WGContainerViewController *)containerViewController didSelectViewController:(UIViewController *)viewController;

- (id <UIViewControllerAnimatedTransitioning>)containerController:(WGContainerViewController *)containerController
               animationControllerForTransitionFromViewController:(UIViewController *)formVC
                                             toViewViewController:(UIViewController *)toVC;

@end