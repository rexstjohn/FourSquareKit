//
//  UXRFourSquarePhotoModel+Validation.m
//  FourSquareKit
//
//  Created by Rex St. John on 3/9/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRFourSquarePhotoModel+Validation.h"

@implementation UXRFourSquarePhotoModel (Validation)

-(BOOL)isValid{
    BOOL isValid = YES;
    isValid = self.height != nil;
    isValid = self.width != nil;
    isValid = self.prefix != nil;
    return isValid;
}

@end