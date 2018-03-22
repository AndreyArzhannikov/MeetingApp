//
//  MeetingDTO.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeetingDTO : NSObject <NSCopying>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *organizationId;

- (instancetype)initWithName:(NSString *)name
              organizationId:(NSString *)organizationId;

@end
