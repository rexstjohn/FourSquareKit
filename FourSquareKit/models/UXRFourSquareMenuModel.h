//
//  UXRFourSquareMenuModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareMenuModel : UXRBaseModel
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *label;
@property(nonatomic,strong) NSString *anchor;
@property(nonatomic,strong) NSURL *url;
@property(nonatomic,strong) NSURL *mobileUrl;
@end
