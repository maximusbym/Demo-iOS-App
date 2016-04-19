//
//  MKMapDataManager.m
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKMapDataManager.h"
#import "MKMapAnnotation.h"

@interface MKMapDataManager ()

@property (strong, nonatomic) MKMapAnnotation *annotationModel;

@end

@implementation MKMapDataManager

- (MKMapDataManager*)init
{
    self = [super init];
    if (self) {
        self.annotationModel = [[MKMapAnnotation alloc] init];
    }
    return self;
}

- (void) addPointX: (CGFloat)latitude Y: (CGFloat)longitude {
    
    NSDictionary *point = [[NSDictionary alloc] initWithObjectsAndKeys:
                                            @"new pin",     @"title",
                                            @(latitude),    @"latitude",
                                            @(longitude),   @"longitude",
                                                            nil];
    
    [self.annotationModel.annotations addObject: point];
    [self.annotationModel save];
}

- (NSMutableArray*) annotations {

    return self.annotationModel.annotations;
}

@end
