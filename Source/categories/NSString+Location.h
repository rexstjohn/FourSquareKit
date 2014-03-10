//
//  NSString+Location.h
//  UXRX
//
//  Category methods for producing stringified location data.
//
//  Created by Rex St John on 10/18/12.
//  Copyright (c) 2012 UXRX. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;

@interface NSString (Location)

// Produces a string from a location e.g. latitude and longitude in string format.
+ (NSString *)stringFromLocation:(CLLocation *)location;

+ (NSString *) milesToString:(float) miles inCountry:(NSString *)country;

+ (CLLocation *)locationFromString:(NSString *)locString;

@end
