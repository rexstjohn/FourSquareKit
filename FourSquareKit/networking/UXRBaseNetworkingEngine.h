//
//  UXRBaseNetworkingEngine.h
//  FourSquareKit
//
//  This is largely used for downloading images.
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface UXRBaseNetworkingEngine : MKNetworkEngine

+(UXRBaseNetworkingEngine*) sharedInstance;

@end
