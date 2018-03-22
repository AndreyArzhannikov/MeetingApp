//
//  UIViewController+ShowError.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 19.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "UIViewController+ShowError.h"

@implementation UIViewController (ShowError)

- (void)alertViewWithMessage:(NSString *)message {
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault handler:nil];
    [alertViewController addAction:okAction];
    
    [self presentViewController:alertViewController animated:YES completion:nil];
}

@end
