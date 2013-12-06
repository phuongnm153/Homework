//
//  Models.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject
@property(nonatomic, retain) NSString *model_name;
@property(nonatomic, retain) NSString *model_icon;
@property(nonatomic, retain) NSString *model_info;
@property(nonatomic, retain) NSString *model_avatar;
@property(nonatomic, assign) int *model_rating;
- (id) initWithName: (NSString*) name
            andIcon: (NSString*) icon
            andInfo: (NSString*) info
            andAvatar:(NSString*) avatar
            andRating:(int) rating;

@end
