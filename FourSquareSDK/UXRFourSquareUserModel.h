//
//  UXRFourSquareUserModel.h
//  FourSquare SDK iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
@class UXRFourSquarePhotoModel;

/*
 firstName = Nicholas;
 gender = male;
 id = 13122781;
 lastName = "Z.";
 photo =                 {
 prefix = "https://irs0.4sqi.net/img/user/";
 suffix = "/PPBJPFXZ2XO04W2Y.jpg";
 };
 */

@interface UXRFourSquareUserModel : UXRBaseModel
@property(nonatomic,strong) NSString *firstName;
@property(nonatomic,strong) NSString *gender;
@property(nonatomic,strong) NSString *lastName;
@property(nonatomic,strong) UXRFourSquarePhotoModel *photo;
@end
