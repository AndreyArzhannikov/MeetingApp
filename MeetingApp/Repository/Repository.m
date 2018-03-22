//
//  Repository.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "Repository.h"
#import "Models.h"
#import "NetworkDTO.h"

@interface MeetingsRepository ()

@property (nonatomic, strong) NetworkService *networkService;

@end


@implementation MeetingsRepository

- (instancetype)initWithNetworkService:(NetworkService *)networkService {
    self = [super init];
    if (self) {
        _networkService = networkService;
    }
    return self;
}

- (void)meetingsWithCompletion:(MeetingsCompletionBlock)completion {
    __block NSError *meetingsError = nil;
    __block NSError *organizationsError = nil;
    __block NSArray *meetings = nil;
    __block NSArray *organizations = nil;
    
    dispatch_group_t dispatchGroup = dispatch_group_create();
    
    dispatch_group_enter(dispatchGroup);
    [self.networkService loadMeetingsWithCompletion:^(NSArray *meetingsDTO, NSError *error) {
        meetingsError = error;
        meetings = meetingsDTO;
        dispatch_group_leave(dispatchGroup);
    }];
    
    dispatch_group_enter(dispatchGroup);
    [self.networkService loadOrganizationWithCompletion:^(NSArray *organizationsDTO, NSError *error) {
        organizationsError = error;
        organizations = organizationsDTO;
        dispatch_group_leave(dispatchGroup);
    }];
    
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
        NSError *error = nil;
        if (meetingsError || organizationsError) {
            error = meetingsError ?: organizationsError;
        }

        NSArray* meetingsList = [self makeMeetingsFromMeetingsDTO:meetings
                                                       organizationsDTO:organizations];
        completion(meetingsList, error);
    });
}

- (NSArray *)makeMeetingsFromMeetingsDTO:(NSArray *)meetingsDTO
                        organizationsDTO:(NSArray *)organizationsDTO {
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    for (OrganizationDTO *organizationDTO in organizationsDTO) {
        if (![dictionary objectForKey:organizationDTO.organizationId]) {
            [dictionary setValue:organizationDTO forKey:organizationDTO.organizationId];
        }
    }
    
    NSMutableArray *meetings = [[NSMutableArray alloc] initWithCapacity:meetingsDTO.count];
    for (int i = 0; i < meetingsDTO.count; ++i) {
        MeetingDTO *meetingDTO = meetingsDTO[i];
        NSString *organizationId = meetingDTO.organizationId;
        Organization *organization = [dictionary objectForKey:organizationId];
        if (organization) {
            Meeting *meeting = [[Meeting alloc] initWithName:meetingDTO.name
                                                organization:organization];
            [meetings addObject:meeting];
        }
    }
    
    return [meetings copy];
}

@end
