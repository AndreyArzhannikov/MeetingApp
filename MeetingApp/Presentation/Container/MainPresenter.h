//
//  Presenter.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainView.h"
#import "Repository.h"

@interface MainPresenter : NSObject

@property (nonatomic, weak) id<MainView> view;

- (instancetype)initWithRepository:(id<Repository>)repository;

- (void)viewDidLoad;

@end
