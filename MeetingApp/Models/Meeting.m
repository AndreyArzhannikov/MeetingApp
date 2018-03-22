//
//  Meeting.m
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import "Meeting.h"

@implementation Meeting

- (instancetype)initWithName:(NSString*)name
              organization:(Organization *)organization {
    self = [super init];
    if (self) {
        _name = [name copy];
        _organization = [organization copy];
    }
    
    return self;
}

- (BOOL)isEqual:(id)obj
{
    if(![obj isKindOfClass:[Meeting class]]) {
        return NO;
    }
    
    Meeting* other = (Meeting*)obj;
    BOOL isNameEqual = self.name == other.name || [self.name isEqualToString:other.name];
    BOOL isOrganizationEqual = self.organization == other.organization || [self.organization isEqual:other.organization];
    return isNameEqual && isOrganizationEqual;
}

- (NSUInteger)hash {
    return self.name.hash ^ self.organization.organizationId.hash;
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
