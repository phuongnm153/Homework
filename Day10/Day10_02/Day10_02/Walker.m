//
//  ViewController.m
//  Day10_02
//
//  Created by MAC on 11/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Walker.h"

@implementation Walker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *imageList = [NSMutableArray new];
        for (int i=1;i<=8;i++)
        {
            [imageList addObject:[UIImage imageNamed:[NSString stringWithFormat:@"walking-%d.gif",i]]];
        }
        self.animationImages = [[NSArray alloc]initWithArray:imageList];
        self.animationRepeatCount=0;
    }
    return self;
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
