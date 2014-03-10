//
//  NSString+Location.m
//  UXRX
//
//  Created by Rex St John on 10/18/12.
//  Copyright (c) 2012 UXRX. All rights reserved.
//

#import "NSString+Location.h"
#import <CoreLocation/CoreLocation.h>
#import "NSString+Utils.h"

@implementation NSString (Location)

+ (NSString *)stringFromLocation:(CLLocation *)location {
    return [NSString stringWithFormat:@"%.6f,%.6f", location.coordinate.latitude, location.coordinate.longitude];
}

+ (NSString *) milesToString:(float) miles inCountry:(NSString *)country {
    BOOL mi = [country isEqual:@"UK"] || [country isEqual:@"US"];
    if (mi) {
        return [NSString stringWithFormat:@"%.2fmi", miles];
    }
    else {
        return [NSString stringWithFormat:@"%.2fkm", miles * 1.609344];
    }
}

+ (CLLocation *)locationFromString:(NSString *)locString {
    if (!locString) {
        return nil;
    }
    
    int comma = [NSString indexOf:locString andSubString:  @","];
    if (comma == -1) {
        return nil;
    }
    CLLocation *location = [[CLLocation alloc] initWithLatitude:[[locString substringToIndex:comma] doubleValue]
                                                      longitude:[[locString substringFromIndex:comma + 1] doubleValue]];
    return location;
}

NSString *stringFromLocation(CLLocation *location) {
    return [NSString stringWithFormat:@"%.6f,%.6f", location.coordinate.latitude, location.coordinate.longitude];
}


@end
