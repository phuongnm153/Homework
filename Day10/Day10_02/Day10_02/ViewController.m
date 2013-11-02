//
//  ViewController.m
//  Day10_02
//
//  Created by MAC on 11/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#import "Walker.h"
#import "City.h"
@interface ViewController ()
{
    BOOL _chk;
    float _alpha,_vx,_vy;
    
}
@property Walker *walker;
@property City *city1;
@property City *city2;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *jumbButton;
@property (weak, nonatomic) IBOutlet UIImageView *bomb;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController
-(void) viewDidLayoutSubviews{
    //
}
-(int) returnNumber{
    return 1;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //numberCity = 1;
    self.walker = [[Walker alloc]initWithFrame:CGRectMake(40,self.view.bounds.size.width-80, 33, 50)];
    self.city1 = [[City alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height,self.view.frame.size.width)];
    self.city2 = [[City alloc]initWithFrame:CGRectMake(self.view.frame.size.height,0, self.view.frame.size.height, self.view.frame.size.width)];
    [self.view addSubview:self.city1];
    [self.view addSubview:self.city2];
    [self.view addSubview:self.walker];
    //[self.view sendSubviewToBack:_walker];
    [self.view sendSubviewToBack:_city1];
    [self.view sendSubviewToBack:_city2];
    self.bomb.center = CGPointMake(self.view.bounds.size.height,self.view.bounds.size.width-55);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(running) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPlay:(id)sender {
    
    _alpha = 0;
    self.walker.animationDuration= 1.0f;
    [self.walker startAnimating];
    _chk = TRUE;
}
- (IBAction)btnStop:(id)sender {
    self.walker.animationDuration = INT16_MAX;
    [self.walker startAnimating];
    _chk = FALSE;
}
- (IBAction)btnJumb:(id)sender {
}
-(void) pause{
    
}
- (void) running{
    if (_chk) {
        _alpha -= M_PI/20;
        self.bomb.transform = CGAffineTransformMakeRotation(_alpha);
        if (self.bomb.center.x <=0) {
            self.bomb.center = CGPointMake(self.view.bounds.size.height +_bomb.bounds.size.width/2-1,self.view.bounds.size.width-55 );
        }else{
            self.bomb.center =CGPointMake(self.bomb.center.x -1, self.bomb.center.y);
        }
    if (self.city1.frame.origin.x > 0- self.view.frame.size.height)
    {
        [self.city1 setFrame:CGRectMake(self.city1.frame.origin.x-1, self.city1.frame.origin.y, self.city1.frame.size.width, self.city1.frame.size.height)];
        [self.city2 setFrame:CGRectMake(self.city2.frame.origin.x-1, self.city2.frame.origin.y, self.city2.frame.size.width, self.city2.frame.size.height)];
    }else{
        //     [self.timer invalidate];
        [self.city1 setFrame:CGRectMake(0, 0, self.city1.frame.size.width, self.city1.frame.size.height)];
        [self.city2 setFrame:CGRectMake(self.view.frame.size.height,0, self.city2.frame.size.width, self.city2.frame.size.height)];
    }
    }
}
@end
