//
//  Tiger.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Tiger.h"

@implementation Tiger
-(id) initWithName:(NSString *)name
{
    self=[super initWithName:name];
    self->_voice=[NSMutableArray arrayWithObjects:@"Oar",@"Krr",@"AA", nil];
    return self;
}

- (void) doSomethingMoveable
{
    self->_moveable = YES;
    
}

@end
