//
//  UXRFourSquareCategoryModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
#import "UXRFourSquarePhotoModel.h"

@interface UXRFourSquareCategoryModel : UXRBaseModel

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) UXRFourSquarePhotoModel *icon;
@property(nonatomic,strong) NSString *pluralName;
@property(nonatomic,strong) NSNumber *primary;
@property(nonatomic,strong) NSString *shortName;

@end
