//
//  AppDelegate.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 13.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "AppDelegate.h"
#import "AppFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    id<AppFactory> appFactory = [[AppFactoryImpl alloc] init];
    
    self.window = appFactory.window;
    self.window.rootViewController = appFactory.rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
