//
//  ViewController.m
//  Day8
//
//  Created by MAC on 10/22/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerB.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn:(id)sender {
    ViewControllerB *sampleView = [[ViewControllerB alloc] init];
    [sampleView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:sampleView animated:YES];
}
- (IBAction)btnFlipHorizontal:(id)sender {
    ViewControllerB *sampleView = [[ViewControllerB alloc] init];
    [sampleView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    sampleView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:sampleView animated:YES];
}
- (IBAction)btnCoverVertical:(id)sender {
    ViewControllerB *sampleView = [[ViewControllerB alloc] init];
    [sampleView setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    sampleView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:sampleView animated:YES];
}
- (IBAction)btnCrossDissolve:(id)sender {
    ViewControllerB *sampleView = [[ViewControllerB alloc] init];
    [sampleView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    sampleView.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:sampleView animated:YES];
}

@end
