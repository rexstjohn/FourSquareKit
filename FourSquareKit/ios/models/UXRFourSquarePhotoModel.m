//
//  UXRFourSquarePhotoModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquarePhotoModel.h"
#import "UXRFourSquareUserModel.h"

@implementation UXRFourSquarePhotoModel

- (void) setPrefix:(id)url {
    if (nil == url) {
        _prefix = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _prefix = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _prefix = [NSURL URLWithString:url];
    }
}

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

-(NSURL*)fullPhotoURL{
    /*
     Ending of the URL for this photo.
     
     To assemble a resolvable photo URL, take prefix + size + suffix, e.g. https://irs0.4sqi.net/img/general/300x500/2341723_vt1Kr-SfmRmdge-M7b4KNgX2_PHElyVbYL65pMnxEQw.jpg.
     
     size can be one of the following, where XX or YY is one of 36, 100, 300, or 500.
     XXxYY
     original: the original photo's size
     capXX: cap the photo with a width or height of XX (whichever is larger). Scales the other, smaller dimension proportionally
     widthXX: forces the width to be XX and scales the height proportionally
     heightYY: forces the height to be YY and scales the width proportionally
     */
    //https://developer.foursquare.com/docs/responses/photo
    NSString *size = @"500x500";
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@%@", [self.prefix absoluteString],size,self.suffix ];
    return [NSURL URLWithString:fullUrl];
}

#pragma mark - Photo Delegate Methods

-(NSURL*)photoDownloadURL{
    return [self fullPhotoURL];
}

@end
