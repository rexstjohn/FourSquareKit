//
//  NSDictionary+PList.h
//  UXRX
//
//  Created by Rex St John on 6/7/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PList)

+(NSDictionary*)dictionaryFromPlistWithName:(NSString*)plistName;

@end
