//
//  Videos.m
//  CodeCamp1
//
//  Created by MAC on 11/28/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Videos.h"

@implementation Videos
- (id) initWithName: (NSString*) name
            andLogo: (NSString*) logoFile
            andLink: (NSString *)url
{
    if (self = [super init]) {
        self.name = name;
        self.logo = [UIImage imageNamed:logoFile];
        self.url = url;
    }
    return self;
}
@end
