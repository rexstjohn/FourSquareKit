//
//  UXRFourSquareReservationsModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareReservationsModel.h"

@implementation UXRFourSquareReservationsModel

- (void) setUrl:(id)url {
    if (nil == url) {
        _url = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _url = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _url = [NSURL URLWithString:url];
    }
}

@end
