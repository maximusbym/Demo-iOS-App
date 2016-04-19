//
//  ViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 06.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKMainViewController.h"
#import "SWRevealViewController.h"

@interface MKMainViewController ()

@end

@implementation MKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
