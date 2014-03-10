//
//  UXRFourSquareRestaurantModel+Validations.m
//  FourSquareKit
//
//  Created by Rex St. John on 3/9/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRFourSquareRestaurantModel+Validations.h"

@implementation UXRFourSquareRestaurantModel (Validations)

-(BOOL)isValid{
    BOOL isValid = YES;
    isValid = self.name != nil;
    isValid = self.url != nil;
    isValid = self.restaurantId != nil;
    return isValid;
}

@end
