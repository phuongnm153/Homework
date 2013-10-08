//
//  Carnivora.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//  Bộ ăn thịt

#import "Animal.h"
#import "Sounding.h"
@interface Carnivora : Animal <Sounding>
{
    @private
    NSString * _secretNumber;
}
@end
