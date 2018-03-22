//
//  ViewController.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 13.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppFactory.h"
#import "Meeting.h"
#import "MainPresenter.h"
#import "MainView.h"

@protocol AppFactory;

@interface ContainerViewController : UIViewController <MainView>

@property (strong, nonatomic) id<AppFactory> appFactory;
@property (strong, nonatomic) MainPresenter *presenter;

- (instancetype)initWithAppFactory:(id<AppFactory>)appFactory
                         presenter:(MainPresenter *)presenter;

@end

