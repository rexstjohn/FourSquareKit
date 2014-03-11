//
//  UXRFourSquareCommentModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
#import "UXRFourSquareUserModel.h"
#import "UXRFourSquareLikesModel.h"

@interface UXRFourSquareTipModel : UXRBaseModel 
@property(nonatomic,strong) NSNumber *createdAt;
@property(nonatomic,strong) NSString *text;
@property(nonatomic,strong) NSURL *canonicalUrl;
@property(nonatomic,strong) UXRFourSquareUserModel *user;
@property(nonatomic,strong) UXRFourSquareLikesModel *likes;
@end