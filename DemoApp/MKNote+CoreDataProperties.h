//
//  MKNote+CoreDataProperties.h
//  DemoApp
//
//  Created by Max Kalahur on 08.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MKNote.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKNote (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSDate *date;

@end

NS_ASSUME_NONNULL_END
