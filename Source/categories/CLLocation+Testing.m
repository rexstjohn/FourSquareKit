//
//  CLLocation+Testing.m
//  UXRX
//
//  Created by Rex St John on 2/8/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import "CLLocation+Testing.h"

@implementation CLLocation (Testing)

+(CLLocation*)locationInSeattle{
    CLLocationDegrees lat = 47.6097;
    CLLocationDegrees lon = -122.3331;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)locationInNewYork{
    CLLocationDegrees lat = 40.7142;
    CLLocationDegrees lon = -74.0064;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)locationInSanFransisco{
    CLLocationDegrees lat = 37.7750;
    CLLocationDegrees lon = -122.4183;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)locationInBoston{
    CLLocationDegrees lat = 42.3583;
    CLLocationDegrees lon = -71.0603;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)locationInMiami{
    CLLocationDegrees lat = 25.4716;
    CLLocationDegrees lon = -80.1327;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)locationInLondon{
    CLLocationDegrees lat = 51.5171;
    CLLocationDegrees lon = -0.1062;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

+(CLLocation*)randomMajorCity{
    //RSJ: Not yet implemented.
    CLLocationDegrees lat = 47.6097;
    CLLocationDegrees lon = -122.3331;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    return  someLocation;
}

@end
