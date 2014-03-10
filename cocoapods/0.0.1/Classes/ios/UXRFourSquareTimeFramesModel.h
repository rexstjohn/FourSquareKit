//
//  UXRFourSquareTimeFramesModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareTimeFramesModel : UXRBaseModel
@property(nonatomic,strong) NSString *days;
@property(nonatomic,assign) BOOL includesToday;
@property(nonatomic,strong) NSArray *open;
@property(nonatomic,strong) NSArray *segments;
@end
