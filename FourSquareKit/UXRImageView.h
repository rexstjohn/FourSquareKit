//
//  UXRImageView.h
//  FourSquareKit
//
//  Image view used to automatically download images async.
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UXRImageViewEngineCompletionBlock)(UIImage *resultingImage);
typedef void (^UXRImageViewErrorBlock)(NSError *error);

@interface UXRImageView : UIImageView

-(void)downloadImageFromUrl:(NSURL*)url
        withCompletionBlock:(UXRImageViewEngineCompletionBlock)completion
                   andError:(UXRImageViewErrorBlock)errorBlock;

@end
