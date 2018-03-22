//
//  Organization.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Organization : NSObject <NSCopying>

@property (nonatomic, assign, readonly) NSString *organizationId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readonly) double latitude;
@property (nonatomic, assign, readonly) double longitude;

- (instancetype)initWithId:(NSString *) organizationId
                      name:(NSString *)name
                  latitude:(double)latitude
                 longitude:(double)longitude;

@end
