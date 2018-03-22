//
//  MapView.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MapView

- (void)showPinsForMeetings:(NSArray *)meetings;
- (void)showPinForSelectedMeeting:(Meeting *)meeting;
- (void)notifyDelegatePinDidSelectForMeeting:(Meeting *)meeting;
- (void)notifyDelegatePinDidDeselect;

@end
