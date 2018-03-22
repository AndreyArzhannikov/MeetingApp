//
//  AppFactory.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repository.h"
#import "MeetingsViewController.h"
#import "MapViewController.h"

@protocol AppFactory

- (UIViewController *)rootViewController;
- (UIWindow *)window;
- (id<Repository>)repository;
- (MeetingsViewController *)meetingsViewController;
- (MapViewController *)mapViewController;

@end

@interface AppFactoryImpl : NSObject <AppFactory>

@end
