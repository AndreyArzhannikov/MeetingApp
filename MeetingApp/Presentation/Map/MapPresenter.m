//
//  MapPresenter.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MapPresenter.h"

@implementation MapPresenter

- (void)setPinsForMeetings:(NSArray *)meetings {
    [self.view showPinsForMeetings:meetings];
}

- (void)setSelectedPinForSelectedMeeting:(Meeting *)meeting {
    [self.view showPinForSelectedMeeting:meeting];
}

- (void)pinDidSelectForMeeting:(Meeting *)meeting {
    [self.view notifyDelegatePinDidSelectForMeeting:meeting];
}

- (void)pinDidDeselect {
    [self.view notifyDelegatePinDidDeselect];
}

@end
