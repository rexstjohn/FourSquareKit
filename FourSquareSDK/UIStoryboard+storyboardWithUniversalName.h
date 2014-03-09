//
//  UIStoryboard+storyboardWithUniversalName.h
//  UXRX
//
//  Created by JASON CROSS on 3/8/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (storyboardWithUniversalName)

/*!
 @discussion
     relies upon the naming convention being used such that myStoryBoardName exists as 
     myStoryBoardName~ipad.storyboard for the iPad version and 
     myStoryBoardName~iphone for the iPhone version
 */
+ (UIStoryboard*) storyboardWithUniversalName:(NSString*)universalName bundle:(NSBundle *)storyboardBundleOrNil;
+ (UIStoryboard*) storyboardWithName:(NSString*)universalName andInterfaceIdiom:(UIUserInterfaceIdiom)targetIdiom bundle:(NSBundle *)storyboardBundleOrNil;
@end
