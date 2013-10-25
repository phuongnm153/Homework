//
//  ViewController.m
//  Day09
//
//  Created by MAC on 10/25/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *face1;
@property (weak, nonatomic) IBOutlet UIImageView *face2;
@property (weak, nonatomic) IBOutlet UIImageView *face3;


@end

@implementation ViewController
{
    NSLayoutConstraint *layout12;
    NSLayoutConstraint *layout23;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidLayoutSubviews
{
    float viewh =self.view.frame.size.height;
    //float vieww = self.view.frame.size.width;
    float lbl2x =self.face2.center.x;
    float lbl2y = self.face2.center.y;
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait ||
        self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
    self.face1.center = CGPointMake(lbl2x, viewh/4);
        self.face3.center = CGPointMake(lbl2x,viewh*3/4);
    }
    else{
        self.face1.center = CGPointMake(viewh/4,lbl2y);
        self.face3.center = CGPointMake(viewh*3/4,lbl2y );
    }
    /*[self.view removeConstraint:layout12];
    [self.view removeConstraint:layout23];
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait ||
        self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        layout12 = [NSLayoutConstraint constraintWithItem:self.lbl1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.lbl2 attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        layout23 = [NSLayoutConstraint constraintWithItem:self.lbl2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.lbl3 attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.view addConstraint:layout12];
        [self.view addConstraint:layout23];
    }
    else{
        layout12 = [NSLayoutConstraint constraintWithItem:self.lbl1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.lbl2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        layout23 = [NSLayoutConstraint constraintWithItem:self.lbl2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.lbl3 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self.view addConstraint:layout12];
        [self.view addConstraint:layout23];
    }*/
}

@end
