//
//  UIApplication+Orientation.m
//  UXRX
//
//  Created by Rex St John on 3/27/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import "UIApplication+Orientation.h"

@implementation UIApplication (Orientation)

-(BOOL)isLandscape{
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

-(BOOL)isPortrait{
    return !UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

@end
