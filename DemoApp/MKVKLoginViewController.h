//
//  MKFBLoginViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VKSdk.h>
#import <SafariServices/SafariServices.h>

@interface MKVKLoginViewController : UIViewController <VKSdkUIDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller;

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError;

@end
