//
//  MKMapAnnotation.h
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKMapAnnotation : NSObject

@property (strong, nonatomic) NSMutableArray *annotations;

- (void) save;

@end
