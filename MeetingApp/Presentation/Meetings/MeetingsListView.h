//
//  MeetingsListView.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Models.h"

@protocol MeetingsListView

- (void)showMeetingsList:(NSArray *)meetings;
- (void)selectMeeting:(Meeting *)meeting;
- (void)deselectMeeting;
- (void)notifyDelegateMeetingDidSelect:(Meeting *)meeting;

@end
