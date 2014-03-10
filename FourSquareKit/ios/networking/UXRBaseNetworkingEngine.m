//
//  UXRBaseNetworkingEngine.m
//  FourSquareKit
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseNetworkingEngine.h"

@implementation UXRBaseNetworkingEngine

- (id) init {
    static BOOL alreadyInitialized = NO;
    if (alreadyInitialized) {
        return self;
    }
    alreadyInitialized = YES;
    
    self = [super init];
    [self useCache];
    if (self) {
    }
    return self;
}

+(UXRBaseNetworkingEngine*) sharedInstance; {
    static dispatch_once_t onceQueue;
    static UXRBaseNetworkingEngine* _sharedInstance;
    dispatch_once(&onceQueue, ^{ _sharedInstance = [[self alloc] init]; });
    return _sharedInstance;
}

@end
