//
//  AppFactoryImpl.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "AppFactory.h"
#import "ContainerViewController.h"
#import "MainPresenter.h"
#import "MeetingListPresenter.h"
#import "MapPresenter.h"

@implementation AppFactoryImpl

- (UIViewController *)rootViewController {
    return [[ContainerViewController alloc] initWithAppFactory:self
                                                     presenter:[self containerPresenter]];
}

- (UIWindow *)window {
    UIWindow * window = [[UIWindow alloc] init];
    window.backgroundColor = [UIColor whiteColor];
    return window;
}

- (MeetingsViewController *)meetingsViewController {
    MeetingsViewController *meetingsViewController = [[MeetingsViewController alloc] initWithPresenter:[self meetingsPresenter]];
    meetingsViewController.view.backgroundColor = [UIColor colorWithRed:220.0f / 255.0f
                                                                  green:220.0f / 255.0f
                                                                   blue:220.0f / 255.0f
                                                                  alpha:1];
    return meetingsViewController;
}

- (MapViewController *)mapViewController {
    MapViewController *mapViewController = [[MapViewController alloc] initWithPresenter:[self mapPresenter]];
    return mapViewController;
}

- (MainPresenter *)containerPresenter {
    MainPresenter *presenter = [[MainPresenter alloc] initWithRepository:[self repository]];
    return presenter;
}

- (MeetingListPresenter *)meetingsPresenter {
    MeetingListPresenter *presenter = [[MeetingListPresenter alloc] init];
    return presenter;
}

- (MapPresenter *)mapPresenter {
    MapPresenter *presenter = [[MapPresenter alloc] init];
    return presenter;
}

- (id<Repository>)repository {
    return [[MeetingsRepository alloc] initWithNetworkService:[self networkService]];
}

- (NetworkService *)networkService {
    return [[NetworkService alloc] init];
}



@end
