//
//  ViewController.m
//  drawingDay06
//
//  Created by MAC on 10/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#include "Mypicture.h"
@interface ViewController ()

@end

@implementation ViewController

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
- (IBAction)btnAction:(id)sender {
    Mypicture *pic = [Mypicture new];
    [pic setWidth:20 andHeight:5];
    [pic draw];
}
- (IBAction)drawoto:(id)sender {
    Mypicture *pic = [Mypicture new];
    [pic drawoto];
}

@end
