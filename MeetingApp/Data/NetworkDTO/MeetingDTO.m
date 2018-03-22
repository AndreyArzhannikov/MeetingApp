//
//  MeetingDTO.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "MeetingDTO.h"

@implementation MeetingDTO

- (instancetype)initWithName:(NSString*)name
              organizationId:(NSString *)organizationId; {
    self = [super init];
    if (self) {
        _name = [name copy];
        _organizationId = [organizationId copy];
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
