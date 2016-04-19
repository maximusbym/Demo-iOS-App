//
//  MKFBTableViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKVKTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (IBAction)vkLogOut:(id)sender;

@end
