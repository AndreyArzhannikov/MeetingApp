//
//  Meeting.h
//  MeetingApp
//
//  Created by Andrey Arzhannikov on 18.12.17.
//  Copyright © 2017 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization.h"

@interface Meeting : NSObject <NSCopying>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) Organization *organization;

- (instancetype)initWithName:(NSString *)name
                organization:(Organization *)organization;

@end
