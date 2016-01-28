//
//  TutorialPageViewController.m
//  AdBank
//
//  Created by Gábor Gór on 05/12/15.
//  Copyright © 2015 Gor, Gabor. All rights reserved.
//

#import "PageController.h"
#import "TutorialPageViewController.h"
#import "TutorialScreen1ViewController.h"
#import "TutorialScreen2ViewController.h"
#import "TutorialScreen3ViewController.h"

@interface TutorialPageViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation TutorialPageViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:nil];

    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"TutorialStoryboard" bundle:nil];
    TutorialScreen1ViewController *initialViewController1 = [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialScreen1ViewController"];
    TutorialScreen2ViewController *initialViewController2 = [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialScreen2ViewController"];
    TutorialScreen3ViewController *initialViewController3 = [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialScreen3ViewController"];

    self.viewControllers = @[ initialViewController1, initialViewController2, initialViewController3 ];

    [self.pageController setViewControllers:@[ self.viewControllers[0] ]
                                  direction:UIPageViewControllerNavigationDirectionForward
                                   animated:NO
                                 completion:nil];

    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];

    // Bring the common ui elemnt to top of the view
    [self.view bringSubviewToFront:self.skipButton];
    [self.view bringSubviewToFront:self.titleLabel];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController<PageController> *)viewController {

    int index = [viewController indexfOfController];

    if (index == 0) {
        return nil;
    }

    // Decrease the index by 1 to return
    index--;

    return self.viewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController<PageController> *)viewController {

    int index = [viewController indexfOfController];

    index++;

    if (index == [self.viewControllers count]) {
        return nil;
    }

    return self.viewControllers[index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [self.viewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}
- (IBAction)skipButtonAction:(id)sender {
    NSLog(@"skip");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
