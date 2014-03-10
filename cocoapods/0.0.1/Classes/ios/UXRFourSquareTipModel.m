//
//  UXRFourSquareCommentModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareTipModel.h"

@implementation UXRFourSquareTipModel


- (void) setUser:(id)user {
    if (nil == user) {
        _user = nil;
    }
    else if ([user isKindOfClass:[UXRFourSquareUserModel class]]) {
        _user = user;
    }
    else if ([user isKindOfClass:[NSDictionary class]]) {
        _user = [[UXRFourSquareUserModel alloc ] initWithDictionary:user];
    }
}

- (void) setCanonicalUrl:(id)url {
    if (nil == url) {
        _canonicalUrl = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _canonicalUrl = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _canonicalUrl = [NSURL URLWithString:url];
    }
}

- (void) setLikes:(id)likes {
    if (nil == likes) {
        _likes = nil;
    }
    else if ([likes isKindOfClass:[NSURL class]]) {
        _likes = likes;
    }
    else if ([likes isKindOfClass:[NSDictionary class]]) {
        _likes = [[UXRFourSquareLikesModel alloc] initWithDictionary:likes];
    }
}

@end
