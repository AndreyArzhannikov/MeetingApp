//
//  MapPresenter.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Models.h"
#import "MapView.h"

@interface MapPresenter : NSObject

@property (nonatomic, weak) id<MapView> view;

- (void)setPinsForMeetings:(NSArray *)meetings;
- (void)setSelectedPinForSelectedMeeting:(Meeting *)meeting;
- (void)pinDidSelectForMeeting:(Meeting *)meeting;
- (void)pinDidDeselect;

@end

