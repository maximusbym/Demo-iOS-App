//
//  MKFBLoginViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>

@interface MKVKLoginViewController : UIViewController <VKSdkDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result;

- (void)vkSdkUserAuthorizationFailed;

@end
