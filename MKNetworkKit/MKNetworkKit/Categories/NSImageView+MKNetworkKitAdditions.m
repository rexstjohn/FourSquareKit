//
//  NSImageView+MKNetworkKitAdditions.m
//  FourSquareKit-OSX
//
//  Created by JASON CROSS on 3/6/15.
//  Copyright (c) 2015 UX RX. All rights reserved.
//
//  Originally Created by Mugunth Kumar (@mugunthkumar) on 18/01/13.
//  Copyright (C) 2011-2020 by Steinlogic Consulting and Training Pte Ltd

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "NSImageView+MKNetworkKitAdditions.h"

#import "MKNetworkEngine.h"

#import <objc/runtime.h>

static MKNetworkEngine *DefaultEngine;
static char imageFetchOperationKey;

const float kFromCacheAnimationDuration = 0.1f;
const float kFreshLoadAnimationDuration = 0.35f;

@interface NSImageView (/*Private Methods*/)
@property (strong, nonatomic) MKNetworkOperation *imageFetchOperation;
@end

@implementation NSImageView (MKNetworkKitAdditions)

-(MKNetworkOperation*) imageFetchOperation {
    
    return (MKNetworkOperation*) objc_getAssociatedObject(self, &imageFetchOperationKey);
}

-(void) setImageFetchOperation:(MKNetworkOperation *)imageFetchOperation {
    
    objc_setAssociatedObject(self, &imageFetchOperationKey, imageFetchOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void) setDefaultEngine:(MKNetworkEngine*) engine; {
    
    DefaultEngine = engine;
}

-(MKNetworkOperation*) setImageFromURL:(NSURL*) url; {
    
    return [self setImageFromURL:url placeHolderImage:nil];
}

-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImage*) image; {
    
    return [self setImageFromURL:url placeHolderImage:image usingEngine:DefaultEngine animation:YES];
}

-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImage*) image animation:(BOOL) yesOrNo; {
    
    return [self setImageFromURL:url placeHolderImage:image usingEngine:DefaultEngine animation:yesOrNo];
}

-(MKNetworkOperation*) setImageFromURL:(NSURL*) url placeHolderImage:(NSImage*) image usingEngine:(MKNetworkEngine*) imageCacheEngine animation:(BOOL) yesOrNo; {
    
    if(image) self.image = image;
    [self.imageFetchOperation cancel];
    if(!imageCacheEngine) imageCacheEngine = DefaultEngine;
    
    if(imageCacheEngine) {
        self.imageFetchOperation = [imageCacheEngine imageAtURL:url completionHandler:^(NSImage *fetchedImage, NSURL *url, BOOL isInCache) {
            self.image = fetchedImage;
        } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
            DLog(@"%@", error);
        }];
    } else {
        
        DLog(@"No default engine found and imageCacheEngine parameter is null")
    }
    
    return self.imageFetchOperation;

}

@end