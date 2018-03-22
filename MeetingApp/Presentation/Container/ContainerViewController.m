//
//  ViewController.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 13.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "ContainerViewController.h"
#import "MeetingsViewController.h"
#import "MapViewController.h"
#import "UIViewController+ShowError.h"

@interface ContainerViewController () <MeetingsViewControllerDelegate, MapViewControllerDelegate>

@property (strong, nonatomic) MapViewController *mapViewController;
@property (strong, nonatomic) MeetingsViewController *meetingsViewController;

@end

@implementation ContainerViewController

- (instancetype)initWithAppFactory:(id<AppFactory>)appFactory
                         presenter:(MainPresenter *)presenter {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _appFactory = appFactory;
        _presenter = presenter;
        _presenter.view = self;
    }
    
    return self;
}

// MARK: Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.meetingsViewController = [self.appFactory meetingsViewController];
    self.meetingsViewController.delegate = self;
    [self addToContainerChildViewController:self.meetingsViewController];
    
    self.mapViewController = [self.appFactory mapViewController];;
    self.mapViewController.delegate = self;
    [self addToContainerChildViewController:self.mapViewController];
    
    [self.presenter viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.meetingsViewController.view.frame = CGRectMake(0,
                                             self.topLayoutGuide.length,
                                             self.view.bounds.size.width / 3,
                                             self.view.bounds.size.height);
    
    self.mapViewController.view.frame = CGRectMake(self.meetingsViewController.view.frame.size.width,
                                    self.topLayoutGuide.length,
                                    self.view.bounds.size.width * 2 / 3,
                                    self.view.bounds.size.height);
}

// MARK: - MainView

- (void)showErrorWithMessage:(NSString *)message {
    [self alertViewWithMessage:message];
    
}
- (void)showMeetings:(NSArray *)meetings {
    [self.meetingsViewController.presenter setMeetings:meetings];
    [self.mapViewController.presenter setPinsForMeetings:meetings];
}

// MARK: - MeetingsViewControllerDelegate

- (void)meetingsViewController:(MeetingsViewController *)viewController didSelectMeeting:(Meeting *)meeting {
    [self.mapViewController.presenter setSelectedPinForSelectedMeeting:meeting];
}

// MARK: - MapViewControllerDelegate

- (void)mapViewController:(MapViewController *)viewController didSelectPinWithMeeting:(Meeting *)meeting {
    [self.meetingsViewController.presenter setSelectedMeeting:meeting];
}

- (void)mapViewControllerDidDeselectPin:(MapViewController *)viewController {
    [self.meetingsViewController.presenter setDeselectedMeeting];
}

// MARK: - Helpers

- (void)addToContainerChildViewController:(UIViewController *)viewController {
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

@end
