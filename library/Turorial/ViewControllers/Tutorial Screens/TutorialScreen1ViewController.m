//
//  TutorialScreen1ViewController.m
//  AdBank
//
//  Created by Gábor Gór on 06/12/15.
//  Copyright © 2015 Gor, Gabor. All rights reserved.
//

#import "TutorialScreen1ViewController.h"
#import "PageController.h"

@interface TutorialScreen1ViewController () <PageController>

@property (nonatomic, strong) NSNumber * controllerIndex;

@end

@implementation TutorialScreen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Setter / Getter

-(NSNumber *)controllerIndex {
    if (!_controllerIndex) {
        _controllerIndex = @0;
    }
    return _controllerIndex;
}

#pragma mark - PageController protocol

-(int)indexfOfController {
    return [self.controllerIndex intValue];
}

@end
