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
    BOOL _chk,_blJumb,_topJumb;
    float _alpha,_vx,_vy,_speed;
    int _score;
}
@property Walker *walker;
@property City *city1;
@property City *city2;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *jumbButton;
@property (weak, nonatomic) IBOutlet UIImageView *bomb;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)int rdbg;
@end

@implementation ViewController
-(void) viewDidLayoutSubviews{
    //
}
-(int) returnNumber{
    return _rdbg;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.walker = [[Walker alloc]initWithFrame:CGRectMake(40,self.view.bounds.size.width-80, 33, 50)];
    [self.view addSubview:self.walker];
    [self.view sendSubviewToBack:_walker];
    [self initNew];
    self.bomb.center = CGPointMake(self.view.bounds.size.height+self.bomb.bounds.size.width/2,self.view.bounds.size.width-55);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(running) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPlay:(id)sender {
    if ([_playButton.titleLabel.text isEqualToString:@"Play Again"]) {
        [_city1 removeFromSuperview];
        [_city2 removeFromSuperview];
        [self initNew];
        _stopButton.enabled = YES;
        self.walker.center = CGPointMake(40+self.walker.bounds.size.width/2, self.view.bounds.size.height-80+self.walker.bounds.size.height/2);
    }
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
    float x = self.walker.center.y;
    float y = self.view.bounds.size.height;
    if (x ==y-55 ) {
        _blJumb = TRUE;
        _topJumb= FALSE;
    }
}
- (IBAction)backgrChange:(id)sender {
    _rdbg =arc4random()%3;
    [_city1 removeFromSuperview];
    [_city2 removeFromSuperview];
    self.city1 = [[City alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height,self.view.frame.size.width)];
    self.city2 = [[City alloc]initWithFrame:CGRectMake(self.view.frame.size.height,0, self.view.frame.size.height, self.view.frame.size.width)];
    [_city1 imageNumber:_rdbg];
    [_city2 imageNumber:_rdbg];
    [self.view addSubview:self.city1];
    [self.view addSubview:self.city2];
    [self.view sendSubviewToBack:_city1];
    [self.view sendSubviewToBack:_city2];
}
-(void) initNew{
    _rdbg =arc4random()%3;
    self.city1 = [[City alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height,self.view.frame.size.width)];
    self.city2 = [[City alloc]initWithFrame:CGRectMake(self.view.frame.size.height,0, self.view.frame.size.height, self.view.frame.size.width)];
    [_city1 imageNumber:_rdbg];
    [_city2 imageNumber:_rdbg];
    [self.view addSubview:self.city1];
    [self.view addSubview:self.city2];
    [self.view sendSubviewToBack:_city1];
    [self.view sendSubviewToBack:_city2];
    _score = 0;
    self.bomb.center = CGPointMake(self.view.bounds.size.width,self.view.bounds.size.height-55);
    _speed = 1;
    _blJumb = FALSE;
    [_playButton setTitle:@"Play" forState:UIControlStateNormal];
}
-(void) jumbing{
    if (_blJumb) {
        self.walker.animationDuration = INT16_MAX;
        [self.walker startAnimating];
        if (self.walker.center.y > 190 && !_topJumb) {
            self.walker.center = CGPointMake(self.walker.center.x, self.walker.center.y -2);
        }else if (self.walker.center.y < self.view.bounds.size.height-55){
            _topJumb = TRUE;
            self.walker.center = CGPointMake(self.walker.center.x, self.walker.center.y +1);
        }else if(self.walker.center.y >= self.view.bounds.size.height-55){
            _blJumb = FALSE;
            self.walker.animationDuration= 1.0f;
            [self.walker startAnimating];
           
        }
    }
}
-(void) bombAction{
    _alpha -= (M_PI/60+_speed/20);
    self.bomb.transform = CGAffineTransformMakeRotation(_alpha);
    if (self.bomb.center.x <=0) {
        CGSize size = self.view.bounds.size;
        self.bomb.center = CGPointMake(size.width +(_bomb.bounds.size.width/2)-1,size.height-55 );
        _speed +=0.3;
         _score ++;
    }else{
        self.bomb.center =CGPointMake(self.bomb.center.x -_speed, self.bomb.center.y);
    }
}
-(BOOL) checkImpact{
    
    float xMan = self.walker.frame.origin.x;
    float yMan = self.walker.frame.origin.y;
    float xBomb = self.bomb.frame.origin.x;
    float yBomb = self.bomb.frame.origin.y;
    CGSize sizeMan = self.walker.bounds.size;
    CGSize sizeBomb = self.bomb.bounds.size;
    if ((xBomb+20<=xMan && xMan<=xBomb+sizeBomb.width-10) || (xBomb+20<=xMan+sizeMan.width && xMan+sizeMan.width<=xBomb+sizeBomb.width-10)) {
        if (yMan + sizeMan.height > yBomb+20) {
            return true;
        }
    }
    return FALSE;
}
- (void) running{
    if (_chk) {
        [self jumbing];
        [self bombAction];
    if (self.city1.frame.origin.x > 0- self.view.frame.size.height)
    {
        [self.city1 setFrame:CGRectMake(self.city1.frame.origin.x-1, self.city1.frame.origin.y, self.city1.frame.size.width, self.city1.frame.size.height)];
        [self.city2 setFrame:CGRectMake(self.city2.frame.origin.x-1, self.city2.frame.origin.y, self.city2.frame.size.width, self.city2.frame.size.height)];
    }else{
        //     [self.timer invalidate];
        [self.city1 setFrame:CGRectMake(0, 0, self.city1.frame.size.width, self.city1.frame.size.height)];
        [self.city2 setFrame:CGRectMake(self.view.frame.size.height,0, self.city2.frame.size.width, self.city2.frame.size.height)];
    }
        if ([self checkImpact]) {
            self.walker.animationDuration = INT16_MAX;
            [self.walker startAnimating];
            _chk = FALSE;
            [_playButton setTitle:@"Play Again" forState:UIControlStateNormal];
            _stopButton.enabled = NO;
        }else
        {
            _lblScore.text = [NSString stringWithFormat:@"%d",_score*100];
        }
    }
}
@end
