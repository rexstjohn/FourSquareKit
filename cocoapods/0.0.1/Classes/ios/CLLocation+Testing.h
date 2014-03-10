//
//  CLLocation+Testing.h
//  UXRX
//
//  Created by Rex St John on 2/8/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (Testing)

+(CLLocation*)locationInSeattle;
+(CLLocation*)locationInNewYork;
+(CLLocation*)locationInSanFransisco;
+(CLLocation*)locationInBoston;
+(CLLocation*)locationInMiami;
+(CLLocation*)locationInLondon;
+(CLLocation*)randomMajorCity;

@end
