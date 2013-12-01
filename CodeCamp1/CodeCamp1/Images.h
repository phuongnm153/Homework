//
//  Images.h
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Images : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIImage* logo;


- (id) initWithName: (NSString*) name
            andLogo: (NSString*) logoFile;

@end
