//
//  Models.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Models.h"

@implementation Models
- (id) initWithName: (NSString*) name
        andBirthday: (NSString*) birthday
         andCountry: (NSString*) country
             andAge: (int) age
      andOccupation: (NSString*) occupation
       andYearBegin: (int) yearbegin
          andHeight: (NSString*) height
       andHairColor: (NSString*) haircolor
        andEyeColor: (NSString*) eyecolor
    andMeasurements: (NSString*) measurements
          andAvatar: (NSString*) avatar
          andRating: (int) rating
{
    if (self = [super init]) {
        self.model_name = name;
        self.model_birthday = birthday;
        self.model_country = country;
        self.model_age = age;
        self.model_occupation = occupation;
        self.model_yearsBegin = yearbegin;
        self.model_height = height;
        self.model_haircolor = haircolor;
        self.model_eyecolor = eyecolor;
        self.model_measurements = measurements;
        self.model_avatar = avatar;
        self.model_rating = rating;
    }
    return self;
}
@end
