//
//  NetworkService.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "NetworkService.h"
#import "NetworkDTO.h"

// TODO: Refactor it, e.g. make Endpoint object
NSString * const kMeetingsUrlString = @"http://demo1150037.mockable.io/meetings";
NSString * const kOrganizationUrlString = @"http://demo1150037.mockable.io/organizations";


@interface NetworkService ()

@property (nonatomic, strong) NSURLSession *urlSession;

@end


@implementation NetworkService

- (instancetype)init {
    self = [super init];
    if (self) {
        _urlSession = [NSURLSession sharedSession];
    }
    return self;
}

- (void)loadMeetingsWithCompletion:(ResultCompletionBlock)completion {
    NSURL *url = [NSURL URLWithString: kMeetingsUrlString];
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
                                                                                              NSURLResponse * _Nullable response,
                                                                                              NSError * _Nullable error) {
        // TODO: Refactor it, e.g. extract Mapper and add error handling
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *parsingError = nil;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
        if (parsingError) {
            completion(nil, error);
            return;
        }
        
        NSMutableArray *meetingsDTO = [[NSMutableArray alloc] initWithCapacity:json.count];
        for(NSDictionary *element in json) {
            NSString *title = [element valueForKey:@"title"];
            NSString *organizationId = [element valueForKey:@"organizationId"];
            
            MeetingDTO *meetingDTO = [[MeetingDTO alloc] initWithName:title
                                                    organizationId:organizationId];
            [meetingsDTO addObject:meetingDTO];
            
        }
        
        completion([meetingsDTO copy], nil);
    }];
    
    [dataTask resume];
}

- (void)loadOrganizationWithCompletion:(ResultCompletionBlock)completion; {
    NSURL *url = [NSURL URLWithString: kOrganizationUrlString];
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
                                                                                              NSURLResponse * _Nullable response,
                                                                                              NSError * _Nullable error) {
        
        // TODO: Refactor it, e.g. extract Mapper and add error handling
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *parsingError = nil;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
        if (parsingError) {
            completion(nil, error);
            return;
        }
        
        NSMutableArray *organizationsDTO = [[NSMutableArray alloc] initWithCapacity:json.count];
        for(NSDictionary *element in json) {
            NSString *title = [element valueForKey:@"title"];
            NSString *organizationId = [element valueForKey:@"organizationId"];
            double latitude = [[element valueForKey:@"latitude"] doubleValue];
            double longitude = [[element valueForKey:@"longitude"] doubleValue];
            
            OrganizationDTO *organizationDTO = [[OrganizationDTO alloc] initWithId:organizationId
                                                                              name:title
                                                                          latitude:latitude
                                                                         longitude:longitude];
            [organizationsDTO addObject:organizationDTO];
        }
        
        completion([organizationsDTO copy], nil);
    }];
    
    [dataTask resume];
}

@end
