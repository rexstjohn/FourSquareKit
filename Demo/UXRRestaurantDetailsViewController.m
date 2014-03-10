//
//  UXRRestaurantDetailsViewController.m
//  Demo
//
//  Created by Rex St. John on 3/9/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRRestaurantDetailsViewController.h"

@interface UXRRestaurantDetailsViewController ()
@property(nonatomic,strong) UXRFourSquareNetworkingEngine *fourSquareEngine;
@property(nonatomic,strong) UXRFourSquareRestaurantModel *restaurantModel;
@end

@implementation UXRRestaurantDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.fourSquareEngine = [UXRFourSquareNetworkingEngine sharedInstance];
    
    // Get a restaurant.
    NSString *exampleRestaurant = @"49efb3d1f964a520f7681fe3";
    __weak UXRRestaurantDetailsViewController *weakSelf = self;
    [self.fourSquareEngine getRestaurantWithId:exampleRestaurant
                           withCompletionBlock:^(UXRFourSquareRestaurantModel *restaurant) {
                               weakSelf.restaurantName.text = restaurant.name;
                               weakSelf.restaurantModel = restaurant;
                               UXRFourSquarePhotoModel *photo = [restaurant.photos objectAtIndex:0];
                               [weakSelf getRestaurantPhoto:photo];
    } failureBlock:^(NSError *error) {
    }];
    
}

- (void) getRestaurantPhoto:(UXRFourSquarePhotoModel*)photo{
//    __weak UXRImageView *weakImage = self.imageView;
//    [self.imageView downloadImageFromUrl:[photo fullPhotoURL]
//     withCompletionBlock:^(UIImage *resultingImage) {
//         [weakImage setImage:resultingImage];
//     } andError:^(NSError *error) {
//        // Failz
//     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
