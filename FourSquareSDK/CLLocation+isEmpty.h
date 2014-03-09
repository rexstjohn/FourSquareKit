//
//  CLLocation+isEmpty.h
//  UXRX
//
//  Created by JASON CROSS on 3/21/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (isEmpty)
+ (BOOL) isEmpty:(CLLocation*)thing;
@end
