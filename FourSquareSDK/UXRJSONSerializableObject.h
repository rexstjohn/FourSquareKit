//
//  UXRJSONSerializableObject.h
//  FMag
//
//  Created by Rex St. John on 12/15/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @protocol USPJsonSerializableObject
 Objects conforming to this protocol guarantee that they will be able to
 be converted to a Dictionary, which in turn is used to serialize the object
 (as its dicitonary representation) to JSON.
 */
@protocol UXRJSONSerializableObject <NSObject>

@required
- (id <NSObject, NSCoding, NSFastEnumeration, NSCopying, NSMutableCopying>) convertToDictionaryOrArray;

@end
