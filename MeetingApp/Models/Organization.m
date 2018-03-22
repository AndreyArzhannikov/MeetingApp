//
//  Organization.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "Organization.h"

@implementation Organization

- (instancetype)initWithId:(NSString *) organizationId
                      name:(NSString *)name
                  latitude:(double)latitude
                 longitude:(double)longitude {
    self = [super init];
    if (self) {
        _organizationId = organizationId;
        _name = [name copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (BOOL)isEqual:(id)obj
{
    if(![obj isKindOfClass:[Organization class]]) {
        return NO;
    }
    
    Organization* other = (Organization*)obj;
    return self.organizationId == other.organizationId || [self.organizationId isEqualToString:other.organizationId];
}

- (NSUInteger)hash {
    return self.organizationId.hash;
}

@end
