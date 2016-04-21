//
//  MKPost.h
//  DemoApp
//
//  Created by Max Kalahur on 20.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKPost : NSObject

@property (strong, nonatomic) NSString* text;

- (id) initWithServerResponse:(NSDictionary*) responseObject;

@end
