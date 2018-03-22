//
//  MapViewController.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@property(strong, nonatomic) MKMapView *mapView;
@property(strong, nonatomic) NSMutableDictionary *pinAnnotations;

@end

@implementation MapViewController

- (instancetype)initWithPresenter:(MapPresenter *)presenter {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _presenter = presenter;
        _presenter.view = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] init];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    self.pinAnnotations = [[NSMutableDictionary alloc] init];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.mapView.frame = self.view.bounds;
}

// MARK: - MapView

- (void)showPinsForMeetings:(NSArray *)meetings {
    for(Meeting *meeting in meetings) {
        MKPointAnnotation *annotation = [self makePinWithCoordinate:CLLocationCoordinate2DMake(meeting.organization.latitude,
                                                                                              meeting.organization.longitude)
                                                              text:[NSString stringWithFormat:@"%@: %@", meeting.name, meeting.organization.name]];
        [self.mapView addAnnotation:annotation];
        [self.pinAnnotations setObject:annotation forKey:meeting];
    }
    [self.mapView showAnnotations:self.mapView.annotations animated:YES];
}

- (void)showPinForSelectedMeeting:(Meeting *)meeting {
    for(MKPointAnnotation *annotation in self.mapView.annotations) {
        [self.mapView deselectAnnotation:annotation animated:YES];
    }
    
    MKPointAnnotation* pinAnnotation = [self.pinAnnotations objectForKey:meeting];
    [self.mapView selectAnnotation:pinAnnotation animated:YES];
}

- (void)notifyDelegatePinDidSelectForMeeting:(Meeting *)meeting {
    [self.delegate mapViewController:self didSelectPinWithMeeting:meeting];
}

- (void)notifyDelegatePinDidDeselect {
    [self.delegate mapViewControllerDidDeselectPin:self];
}

// MARK: - Helpers

-(MKPointAnnotation *)makePinWithCoordinate:(CLLocationCoordinate2D)coordiante text:(NSString *)text {
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
    pointAnnotation.coordinate = coordiante;
    pointAnnotation.title = text;
//    [self.mapView addAnnotation:pointAnnotation];
    return pointAnnotation;
}

// MARK: - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view isKindOfClass:[MKPinAnnotationView class]]) {
        MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)view;
        pinAnnotationView.pinTintColor = [MKPinAnnotationView greenPinColor];
        
        Meeting *meeting = [self.pinAnnotations allKeysForObject:pinAnnotationView.annotation][0];
        [self.presenter pinDidSelectForMeeting:meeting];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view isKindOfClass:[MKPinAnnotationView class]]) {
        MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)view;
        pinAnnotationView.pinTintColor = [MKPinAnnotationView redPinColor];
        
        [self.presenter pinDidDeselect];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if (![annotation isKindOfClass:[MKPointAnnotation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"PinAnnotationView"];
    if (!pinAnnotationView) {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"PinAnnotationView"];
        pinAnnotationView.canShowCallout = YES;
    } else {
        pinAnnotationView.annotation = annotation;
    }
    return pinAnnotationView;
}

@end
