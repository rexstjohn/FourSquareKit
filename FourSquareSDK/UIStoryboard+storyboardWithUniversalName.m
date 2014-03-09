//
//  UIStoryboard+storyboardWithUniversalName.m
//  UXRX
//
//  Created by JASON CROSS on 3/8/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import "UIStoryboard+storyboardWithUniversalName.h"

@implementation UIStoryboard (storyboardWithUniversalName)

static const NSString *iPhoneKey = @"~iPhone";
static const NSString *iPadKey = @"~iPad";

+ (UIStoryboard*) storyboardWithUniversalName:(NSString*)universalName bundle:(NSBundle *)storyboardBundleOrNil {
    
    NSString * suffix = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? [iPadKey copy] : [iPhoneKey copy];
    NSString * name = [NSString stringWithFormat:@"%@%@", universalName, suffix];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:storyboardBundleOrNil];
    
    return storyboard;
}

+ (UIStoryboard*) storyboardWithName:(NSString*)universalName andInterfaceIdiom:(UIUserInterfaceIdiom)targetIdiom bundle:(NSBundle *)storyboardBundleOrNil {
    
    // first check to see if the storyboard file we want exists. If it does not, then assume that the
    // universally-named file does exist
    UIStoryboard * storyboard;
        NSString * suffix = (targetIdiom == UIUserInterfaceIdiomPad) ? [iPadKey copy] : [iPhoneKey copy];
        NSString * name = [NSString stringWithFormat:@"%@%@", universalName, suffix];
        storyboard = [UIStoryboard storyboardWithName:name bundle:storyboardBundleOrNil]; 
    return storyboard;
}

@end
