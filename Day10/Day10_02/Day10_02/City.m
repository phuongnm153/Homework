//
//  ViewController.m
//  Day10_02
//
//  Created by MAC on 11/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "City.h"
#import "ViewController.h"
@implementation City

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}
-(void) imageNumber:(int) number
{
    self.image = [UIImage imageNamed:[NSString stringWithFormat:@"city-%d.png",number]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
