//
//  MeetingListPresenter.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeetingsListView.h"

@interface MeetingListPresenter : NSObject

@property (nonatomic, weak) id<MeetingsListView> view;
@property (nonatomic, strong, readonly) NSArray* meetingsList;

- (void)setMeetings:(NSArray *)meetings;
- (void)setSelectedMeeting:(Meeting*)meeting;
- (void)setDeselectedMeeting;
- (void)meetingDidSelectAt:(NSInteger)index;

@end
