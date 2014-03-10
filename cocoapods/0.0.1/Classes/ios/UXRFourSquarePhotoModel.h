//
//  UXRFourSquarePhotoModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
@class UXRFourSquareUserModel;

@interface UXRFourSquarePhotoModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *createdAt;
@property(nonatomic,strong) NSNumber *height;
@property(nonatomic,strong) NSNumber *width;
@property(nonatomic,strong) NSURL *prefix;
@property(nonatomic,assign) BOOL containsFace;
@property(nonatomic,strong) NSString *suffix;
@property(nonatomic,strong) UXRFourSquareUserModel *user;
@property(nonatomic,strong) NSString *visibility;
-(NSURL*)fullPhotoURL;
@end
