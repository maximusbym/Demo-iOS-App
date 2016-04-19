//
//  MKVKDelegate.h
//  DemoApp
//
//  Created by Max Kalahur on 19.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VKSdk.h>

@interface MKVKDelegate : NSObject <VKSdkDelegate>

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result;

- (void)vkSdkUserAuthorizationFailed;

@end
