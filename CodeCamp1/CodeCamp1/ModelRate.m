//
//  ModelRate.m
//  CodeCamp1
//
//  Created by MAC on 12/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ModelRate.h"

@implementation ModelRate

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeFloat:self.sumClicks forKey:@"sumClicks"];
    [aCoder encodeFloat:self.sumScores forKey:@"sumScores"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _sumClicks = [aDecoder decodeFloatForKey:@"sumClicks"];
        _sumScores = [aDecoder decodeFloatForKey:@"sumScores"];
    }
    return self;
}
@end
