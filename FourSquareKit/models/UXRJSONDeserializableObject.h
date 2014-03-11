//
//  UXRDeserializableObject.h
//  FourSquareKit
//
//  Created by Rex St. John on 12/15/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UXRJSONDeserializableObject : NSObject

- (id) initWithDictionary: (NSDictionary*) dictionary;

/*!
 @property identifier
 the id of the object. The json uses the name 'id', which is a reserverd word in Objective-C
 so instead we use the name 'identifier' to mean the same thing.
 */
@property (nonatomic, assign) NSUInteger identifier;

/*!
 @method
 dateFromJSONDateString:
 Dates will be converted to match the format expected by UrbanSpoon's API:
 Time (UTC).  ISO 8601 format YYYY-MM-DDThh:mm:ssZ, which is JSON standard
 @param
 jsonDate
 the JSON-serialized string representation of a date
 */
+ (NSDate *) dateFromJSONDateString: (NSString *) jsonDate;


#pragma mark - convert from Objective-C to JSON

/*!
 @method convertToJsonSerializableDictionary:
 converts each of the objects contained in the dictionary to NSDictionary objects,
 so that the original dictionary (passed in) can be serialized to JSON
 */
- (NSDictionary *) convertToJsonSerializableDictionary: (NSDictionary*) dictionary;

/*!
 @method convertToJsonSerializableArray:
 converts each of the objects contained in the array to NSDictionary objects,
 so that the original array (passed in) can be serialized to JSON
 */
- (NSArray *) convertToJsonSerializableArray: (NSArray *) array;

/*!
 @method convertDateToJsonFormat:
 Dates will be converted to match the format expected by Yapta's API:
 Time (UTC).  ISO 8601 format YYYY-MM-DDThh:mm:ssZ, which is JSON standard
 */
+ (NSString *) convertDateToJsonFormat: (NSDate *) date;

/*!
 @method convertZuluDateToJsonFormat:
 Dates will be converted to match the format expected by Yapta's API:
 Time (UTC).  ISO 8601 format YYYY-MM-DDThh:mm:ssZ, which is JSON standard
 This method will let us keep GMT times on dates
 */
+ (NSString *) convertZuluDateToJsonFormat: (NSDate *) zuluDate;


@end