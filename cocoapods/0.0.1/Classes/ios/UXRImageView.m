//
//  UXRImageView.m
//  FourSquareKit
//
//  Use for async image downloading.
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRImageView.h"
#import "MKNetworkKit.h"
#import "UXRBaseNetworkingEngine.h"

@interface UXRImageView()
@property (strong, atomic) MKNetworkOperation *networkOperation;
@property (nonatomic,strong) UIActivityIndicatorView *indicator;
@end

@implementation UXRImageView

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.indicator startAnimating];
    }
    
    return self;
}

-(void)downloadImageFromUrl:(NSURL*)url
        withCompletionBlock:(UXRImageViewEngineCompletionBlock)completion
                   andError:(UXRImageViewErrorBlock)errorBlock{
    
    [self.networkOperation cancel];
    self.networkOperation = nil;
    
    // Download or get the cached image.
    UXRBaseNetworkingEngine * sharedEngine = [UXRBaseNetworkingEngine sharedInstance];
    self.networkOperation = [sharedEngine imageAtURL:url
                                   completionHandler:^(UIImage *fetchedImage, NSURL *fetchedURL, BOOL isInCache) {
         [self.indicator removeFromSuperview];
        if(url == fetchedURL){
             self.image = fetchedImage;
            [self setNeedsDisplay];
            
            if(completion != nil){
                completion(fetchedImage);
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        // TODO: Handler Error.
        // Set the image to "Image couldnt be downloaded / broken image" graphic or leave as placeholder.
        [self.indicator removeFromSuperview];
        if(error != nil){
            errorBlock(error);
        }
    }];
}

-(void)dealloc{
    [self.networkOperation cancel];
    self.networkOperation = nil;
}

@end
