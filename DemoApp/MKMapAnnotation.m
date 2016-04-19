//
//  MKMapAnnotation.m
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKMapAnnotation.h"

@interface MKMapAnnotation ()
@property (strong,nonatomic) NSString *plistPath;
@end

@implementation MKMapAnnotation

- (MKMapAnnotation *)init
{
    self = [super init];
    if (self) {
        self.plistPath = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"plist"];
        self.annotations = [NSMutableArray arrayWithContentsOfFile: self.plistPath];
    }
    return self;
}

- (void) save {
    [self.annotations writeToFile:self.plistPath atomically:YES];
}

@end
