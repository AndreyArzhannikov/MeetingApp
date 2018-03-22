//
//  MeetingsViewController.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 17.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeetingsListView.h"
#import "MeetingListPresenter.h"
#import "Models.h"

@class MeetingsViewController;

@protocol MeetingsViewControllerDelegate

- (void)meetingsViewController:(MeetingsViewController *)viewController didSelectMeeting:(Meeting *)meeting;

@end


@interface MeetingsViewController : UIViewController <MeetingsListView>

@property (nonatomic, weak) id <MeetingsViewControllerDelegate> delegate;
@property (strong, nonatomic) MeetingListPresenter *presenter;

- (instancetype)initWithPresenter:(MeetingListPresenter *)presenter;

@end
