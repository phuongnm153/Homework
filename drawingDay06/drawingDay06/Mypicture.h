//
//  Mypicture.h
//  drawingDay06
//
//  Created by MAC on 10/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mypicture : NSObject
@property(nonatomic,assign) int Mywith;
@property(nonatomic,assign) int Myheight;
-(void) setWidth : (int) x andHeight : (int) y;
-(void) draw;
-(void) drawoto;
@end
