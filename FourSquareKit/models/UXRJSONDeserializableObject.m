//
//  UXRDeserializableObject.m
//  FourSquareKit
//
//  Created by Rex St. John on 12/15/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRJSONDeserializableObject.h"
#import "UXRJSONSerializableObject.h"

static NSDateFormatter *longDateFormatter = nil;
static NSDateFormatter *longZuluDateFormatter = nil;
static NSDateFormatter *shortDateFormatter = nil;
static NSDateFormatter *longZuluDateReFormatter = nil;

@implementation UXRJSONDeserializableObject

#pragma mark - initialization

+ (void) initialize {
    // we expect the short date to be in this format:
    // 2011-12-02
    shortDateFormatter = [[NSDateFormatter alloc] init];
    [shortDateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    // we expect the 'long' date to be in this format:
    // 2011-01-12T06:10:00
    longDateFormatter = [[NSDateFormatter alloc] init];
    [longDateFormatter setDateFormat:@"YYYY'-'MM'-'dd'T'HH':'mm':'ss"];
    
    // we expect the 'long' date to sometimes have a 'Z' on the end:
    // 2008-11-25T14:34:01Z
    longZuluDateFormatter = [[NSDateFormatter alloc] init];
    [longZuluDateFormatter setDateFormat:@"YYYY'-'MM'-'dd'T'HH':'mm':'ssZ"];
    [longZuluDateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    //Zulu dates are GMT times and as such need a specific reformatter
    longZuluDateReFormatter = [[NSDateFormatter alloc] init];
    [longZuluDateReFormatter setDateFormat:@"YYYY'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [longZuluDateReFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
}

- (id) initWithDictionary: (NSDictionary*) dictionary; {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

#pragma mark - override equality

- (BOOL) isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    NSUInteger otherId = [(UXRJSONDeserializableObject*)object identifier];
    NSUInteger thisId = self.identifier;
    return (otherId == thisId);
}

- (NSUInteger) hash {
    return [self identifier];
}

#pragma mark - convert from JSON to Objective-C

- (void) setNilValueForKey:(NSString *)key {
    // this blank override prevents an Exception
    
    // *very* noisy logs as city_states calls this method 5000 times
    if (![key isEqualToString:@"major"]) {
        NSLog(@"attempting to set nil value for key: %@", key);
    }
}


- (void) setValue:(id)value forUndefinedKey:(NSString *)key {
    // this blank override prevents an NSUndefinedKeyException
#ifdef TEST
    //    NSAssert(0, @"undefined key during testing");
#endif
    return;
}

- (void) setId:(NSUInteger)identifier {
    [self setIdentifier:identifier];
}

// dealing with dates from JSON being passed in as strings
// Time (UTC).  ISO 8601 format YYYY-MM-DDThh:mm:ssZ, which is JSON standard
+ (NSDate *) dateFromJSONDateString: (NSString *) jsonDate; {
    
    NSDate * returnDate = [[NSDate alloc] init];
    if ([jsonDate length] == 10) {
        returnDate = [shortDateFormatter dateFromString:jsonDate];
    }
    else if ([jsonDate length] == 19) {
        returnDate = [longDateFormatter dateFromString:jsonDate];
    }
    else if ([jsonDate length] == 20) {
        // Z stands for "Zulu", or GMT minus 0 hours
        // this offset information is important; we don't want to lose it
        // therefore must replace the Z with an offset, -0000
        returnDate = [longZuluDateFormatter dateFromString:
                      [jsonDate stringByReplacingOccurrencesOfString:@"Z" withString:@"+0000"]];
    }
    
    return returnDate;
}


#pragma mark - convert from Objective-C to JSON

- (NSDictionary *) convertToJsonSerializableDictionary: (NSDictionary*) originalDictionary; {
    NSMutableDictionary * outDictionary = [[NSMutableDictionary alloc] init];
    NSArray * keys = [originalDictionary allKeys];
    for(int i = 0; i < [keys count]; i++) {
        NSString * key = [keys objectAtIndex:i];
        id valueToBeConverted = [originalDictionary valueForKey:key];
        if([valueToBeConverted respondsToSelector:@selector(convertToDictionaryOrArray)]) {
            id<UXRJSONSerializableObject> serializableValue = valueToBeConverted;
            NSDictionary * convertedValue = (NSDictionary*)[serializableValue convertToDictionaryOrArray];
            if(convertedValue) {
                [originalDictionary setValue:convertedValue
                                      forKey:key];
            }
        }
    }
    return outDictionary;
}


- (NSArray *) convertToJsonSerializableArray: (NSArray *) array; {
    NSMutableArray * outArray = [[NSMutableArray alloc] init];
    // convert all the array members
    for (int i = 0; i < [array count]; i++) {
        id valueToBeConverted = [array objectAtIndex:i];
        if([valueToBeConverted respondsToSelector:@selector(convertToDictionaryOrArray)]) {
            id<UXRJSONSerializableObject> serializableValue = valueToBeConverted;
            NSDictionary * convertedValue = (NSDictionary*)[serializableValue convertToDictionaryOrArray];
            [outArray addObject:convertedValue];
        }
    }
    return outArray;
}

+ (NSString *) convertDateToJsonFormat: (NSDate *) date; {
    
    //TODO: fix formatter to deal with Zulu times
    
    if (longDateFormatter == nil) {
        longDateFormatter = [[NSDateFormatter alloc] init];
        [longDateFormatter setDateFormat:@"YYYY'-'MM'-'dd'T'HH':'mm':'ss"];
    }
    
    NSString *dateString = [longDateFormatter stringFromDate:date];
    return dateString;
}

+ (NSString *) convertZuluDateToJsonFormat: (NSDate *) zuluDate; {
    
    //Zulu dates are GMT times and as such need a specific reformatter
    if (longZuluDateReFormatter == nil) {
        longZuluDateReFormatter = [[NSDateFormatter alloc] init];
        [longZuluDateReFormatter setDateFormat:@"YYYY'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        [longZuluDateReFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    }
    
    NSString *dateString = [longZuluDateReFormatter stringFromDate:zuluDate];
    return dateString;
}

@end

