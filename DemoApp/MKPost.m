//
//  MKPost.m
//  DemoApp
//
//  Created by Max Kalahur on 20.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKPost.h"

@implementation MKPost

- (id) initWithServerResponse:(NSDictionary*) responseObject
{
    if (self) {
        self.text = [responseObject objectForKey:@"text"];
        self.text = [self.text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    }
    return self;
}

@end
