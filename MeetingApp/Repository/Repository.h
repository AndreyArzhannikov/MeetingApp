//
//  Repository.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkService.h"

typedef void(^MeetingsCompletionBlock)(NSArray* meetings, NSError* error);

@protocol Repository

- (void)meetingsWithCompletion:(MeetingsCompletionBlock)completion;

@end


@interface MeetingsRepository : NSObject <Repository>

- (instancetype)initWithNetworkService:(NetworkService *)networkService;

@end
