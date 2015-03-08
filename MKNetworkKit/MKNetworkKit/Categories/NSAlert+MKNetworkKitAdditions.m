//
//  NSAlert+MKNetworkKitAdditions.m
//  FourSquareKit-OSX
//
//  Created by JASON CROSS on 3/6/15.
//  Copyright (c) 2015 UX RX. All rights reserved.
//

#if TARGET_OS_MAC
#import "NSAlert+MKNetworkKitAdditions.h"

@implementation NSAlert (MKNetworkKitAdditions)

+(NSAlert*) showWithError:(NSError*) networkError; {

    NSAlert * alert = [NSAlert alertWithError:networkError];
    [alert show];
}
@end
#endif