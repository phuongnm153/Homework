//
//  TableYears.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "TableYears.h"

@implementation TableYears
- (id) initWithName: (NSString*) name
            andLogo: (NSString*) logoFile
{
    if (self = [super init]) {
        self.name = name;
        self.logo = [UIImage imageNamed:logoFile];
    }
    return self;
}
@end
