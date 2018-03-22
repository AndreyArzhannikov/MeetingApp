//
//  MainView.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainView

- (void)showErrorWithMessage:(NSString *)message;
- (void)showMeetings:(NSArray *)meetings;

@end
