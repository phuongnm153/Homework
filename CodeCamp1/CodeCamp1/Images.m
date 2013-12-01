//
//  Images.m
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Images.h"

@implementation Images
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
