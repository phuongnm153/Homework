//
//  Cat.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Cat.h"

@implementation Cat
-(id) initWithName:(NSString *)name
{
    self=[super initWithName:name];
    self->_voice=[NSMutableArray arrayWithObjects:@"Meo meo",@"me me", nil];
    return self;
}

@end
