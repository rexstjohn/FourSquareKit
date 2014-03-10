//
//  UXRFourSquareMenuModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareMenuModel.h"

@implementation UXRFourSquareMenuModel

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

- (void) setMobileUrl:(id)url {
    if (nil == url) {
        _mobileUrl = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _mobileUrl = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _mobileUrl = [NSURL URLWithString:url];
    }
}
@end
