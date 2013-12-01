//
//  Videos.h
//  CodeCamp1
//
//  Created by MAC on 11/28/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Videos : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIImage* logo;
@property (nonatomic, strong) NSString* url;

- (id) initWithName: (NSString*) name
            andLogo: (NSString*) logoFile
            andLink: (NSString*) url;
@end
