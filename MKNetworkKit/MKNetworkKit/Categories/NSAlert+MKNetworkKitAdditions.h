//
//  NSAlert+MKNetworkKitAdditions.h
//  FourSquareKit-OSX
//
//  Created by JASON CROSS on 3/6/15.
//  Copyright (c) 2015 UX RX. All rights reserved.
//

#if TARGET_OS_MAC
#import <Cocoa/Cocoa.h>

@interface NSAlert (MKNetworkKitAdditions)
+(NSAlert*) showWithError:(NSError*) networkError;
@end
#endif