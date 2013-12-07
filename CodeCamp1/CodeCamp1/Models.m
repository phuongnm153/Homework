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
            andIcon: (NSString*) icon
            andInfo: (NSString*) info
          andAvatar:(NSString*) avatar
          andRating:(NSString*) video
{
    if (self = [super init]) {
        self.model_name = name;
        self.model_icon = icon;
        self.model_info = info;
        self.model_avatar = avatar;
        self.model_video = video;
    }
    return self;
}
@end
