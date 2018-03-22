//
//  MapViewController.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Models.h"
#import "MapView.h"
#import "MapPresenter.h"

@class MapViewController;

@protocol MapViewControllerDelegate

- (void)mapViewController:(MapViewController *)viewController didSelectPinWithMeeting:(Meeting *)meeting;
- (void)mapViewControllerDidDeselectPin:(MapViewController *)viewController;

@end


@interface MapViewController : UIViewController <MapView>

@property (nonatomic, weak) id <MapViewControllerDelegate> delegate;
@property (strong, nonatomic) MapPresenter *presenter;

- (instancetype)initWithPresenter:(MapPresenter *)presenter;

@end
