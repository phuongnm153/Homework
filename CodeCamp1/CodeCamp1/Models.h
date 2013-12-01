//
//  Models.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject
@property(nonatomic, assign) int *model_id;
@property(nonatomic, retain) NSString *model_name;
@property(nonatomic, retain) NSString *model_birthday;
@property(nonatomic, retain) NSString *model_country;
@property(nonatomic, assign) int *model_age;
@property(nonatomic, retain) NSString *model_occupation;
@property(nonatomic, assign) int *model_yearsBegin;
@property(nonatomic, retain) NSString *model_height;
@property(nonatomic, retain) NSString *model_haircolor;
@property(nonatomic, retain) NSString *model_eyecolor;
@property(nonatomic, retain) NSString *model_measurements;
@property(nonatomic, retain) NSString *model_avatar;
@property(nonatomic, assign) int *model_rating;
- (id) initWithName: (NSString*) name
            andBirthday: (NSString*) birthday
            andCountry: (NSString*) country
            andAge: (int) age
            andOccupation: (NSString*) occupation
            andYearBegin:(int) yearbegin
            andHeight:(NSString*) height
            andHairColor:(NSString*) haircolor
            andEyeColor:(NSString*) eyecolor
            andMeasurements:(NSString*) measurements
            andAvatar:(NSString*) avatar
            andRating:(int) rating;

@end
