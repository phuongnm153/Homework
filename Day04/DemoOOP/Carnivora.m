//
//  Carnivora.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Carnivora.h"

@interface Carnivora()
{
    
}
@end

@implementation Carnivora
- (void) doesFunWithPrivateInstantVariable
{
    _secretNumber = @"33898ue4qwoeh";
}

// implement
-(void) sound
{
    NSLog(@"%@", self-> _voice);
}
@end
