//
//  UXRFourSquareCategoryModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareCategoryModel.h"

@implementation UXRFourSquareCategoryModel

- (void) setIcon:(id)icon{
    if (nil == icon) {
        _icon = nil;
    }
    else if ([icon isKindOfClass:[UXRFourSquarePhotoModel class]]) {
        _icon = icon;
    }
    else if ([icon isKindOfClass:[NSDictionary class]]) {
        _icon = [[UXRFourSquarePhotoModel alloc ] initWithDictionary:icon];
    }
}

@end
