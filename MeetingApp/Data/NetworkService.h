//
//  NetworkService.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResultCompletionBlock)(NSArray* meetings, NSError* error);

@interface NetworkService : NSObject

- (void)loadMeetingsWithCompletion:(ResultCompletionBlock)completion;
- (void)loadOrganizationWithCompletion:(ResultCompletionBlock)completion;

@end
