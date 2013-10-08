//
//  Animal.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Animal.h"
@interface Animal()
{
    NSString * _secretDent;
}
@end
@implementation Animal
- (id) initWithName: (NSString*) name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

-(id) initWithName:(NSString *)name andOrigin:(NSString*) origin
{
    if(self=[super init])
    {
        self.name=name;
        self.origin=origin;
    }
    return  self;
}
-(id) initWithName:(NSString *)name andOrigin:(NSString*) origin andPrice: (int) priceAnimal
{
    if(self=[super init])
    {
        
        self.name=name;
        self.origin=origin;
        self.priceAnimal=priceAnimal;
    }
    return  self;}
@end
