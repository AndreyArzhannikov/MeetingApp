//
//  Presenter.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MainPresenter.h"

@interface MainPresenter ()

@property (nonatomic, readonly) id<Repository> repository;

@end

@implementation MainPresenter

- (instancetype)initWithRepository:(id<Repository>)repository {
    self = [super init];
    if (self) {
        _repository = repository;
    }
    
    return self;
}

- (void)viewDidLoad {
    __weak __typeof__(self) weakSelf = self;
    [self.repository meetingsWithCompletion:^(NSArray *meetings, NSError *error) {
        if (error) {
            [weakSelf.view showErrorWithMessage:error.localizedDescription];
            return;
        }

        if (!meetings) {
            // TODO: Refactor it, add locatization, extract message.
            [weakSelf.view showErrorWithMessage:@"Unknown error"];
            return;
        }
        
        [weakSelf.view showMeetings:meetings];
    }];
}

@end
