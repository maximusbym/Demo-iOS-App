//
//  MKMapDataManager.h
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MKDataManager.h"

@interface MKMapDataManager : MKDataManager 

- (void) addPointX:(CGFloat)latitude Y: (CGFloat)longitude;
- (NSMutableArray *) annotations;

@end
