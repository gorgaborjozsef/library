//
//  TutorialPageViewController.h
//  AdBank
//
//  Created by Gábor Gór on 05/12/15.
//  Copyright © 2015 Gor, Gabor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialPageViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@end
