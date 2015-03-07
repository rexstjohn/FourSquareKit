//
//  NSImageView+MKNetworkKitAdditions.h
//  FourSquareKit-OSX
//
//  Created by JASON CROSS on 3/6/15.
//  Copyright (c) 2015 UX RX. All rights reserved.
//

#if TARGET_OS_MAC
#import <Cocoa/Cocoa.h>

extern const float kFromCacheAnimationDuration;
extern const float kFreshLoadAnimationDuration;

@class MKNetworkEngine;
@class MKNetworkOperation;

@interface NSImageView (MKNetworkKitAdditions)
+(void) setDefaultEngine:(MKNetworkEngine*) engine;
-(MKNetworkOperation*) setImageFromURL:(NSURL*) url;
-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImageView*) image;
-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImageView*) image animation:(BOOL) yesOrNo;
-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImageView*) image usingEngine:(MKNetworkEngine*) imageCacheEngine animation:(BOOL) yesOrNo;
@end
#endif