//
//  MeetingListPresenter.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MeetingListPresenter.h"

@interface MeetingListPresenter ()

@property (nonatomic, strong, readwrite) NSArray* meetingsList;

@end


@implementation MeetingListPresenter

- (void)setMeetings:(NSArray *)meetings {
    self.meetingsList = meetings;
    [self.view showMeetingsList:meetings];
}

- (void)setSelectedMeeting:(Meeting*)meeting {
    [self.view selectMeeting:meeting];
}

- (void)setDeselectedMeeting {
    [self.view deselectMeeting];
}

- (void)meetingDidSelectAt:(NSInteger)index {
    [self.view notifyDelegateMeetingDidSelect:self.meetingsList[index]];
}

@end
