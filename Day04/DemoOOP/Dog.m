//
//  Dog.m
//  DemoOOP
//
//  Created by MAC on 10/7/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(id) initWithName:(NSString *)name
{
    self=[super initWithName:name];
    self->_voice=[NSMutableArray arrayWithObjects:@"Gau Gau",@"Ang Ang", nil];
    return self;
}@end
