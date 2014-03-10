//
//  NSString+Utils.m
//  UXRX
//
//  Created by Rex St John on 1/10/13.
//  Copyright (c) 2013 UXRX. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+(NSString *)join:(NSArray *)strings andSeperator:( NSString *)separator {
    if (strings.count == 0) {
        return @"";
    }
    
    NSString *result = nil;
    for (NSString *i in strings) {
        if (result == nil) {
            result = i;
        }
        else {
            result = [result stringByAppendingFormat:@"%@%@", separator, i];
        }
    }
    return result;
}

+(NSArray *)split:(NSString *)s andSeperator:(NSString *)separator{
    if (s.length == 0) {
        return [NSMutableArray arrayWithCapacity:0];
    }
    return [s componentsSeparatedByString:separator];
}

+(int) indexOf:(NSString *)haystack andSubString:(NSString *)needle{
    NSUInteger location = [haystack rangeOfString:needle].location;
    return (location != NSNotFound) ? location : -1;
}

+(BOOL) contains:(NSString *)haystack andSubString:(NSString *)needle {
    return [NSString indexOf:haystack andSubString: needle] != -1;
}

+(BOOL) startsWith:(NSString *)haystack andSubString:( NSString *)needle{
    return [NSString indexOf:haystack andSubString: needle] == 0;
}
@end
