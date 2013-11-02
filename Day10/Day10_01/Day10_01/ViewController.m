//
//  ViewController.m
//  Day10_01
//
//  Created by MAC on 11/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    float _alpha,_constBall;
    float _vx,_vy;
    CGSize _sizeView,_sizeBall;
    float _oldx,_oldy,_curx,_cury;
}
@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (nonatomic, strong) NSTimer * timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _constBall = 5;
    _alpha = 0;
    _sizeView = self.view.bounds.size;
    _sizeBall = self.ball.bounds.size;
    _curx = _ball.center.x;
    _cury = _ball.center.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(id)sender {
    _vx = 1;
    _vy = 1;
    self.timer = [NSTimer timerWithTimeInterval:0.1
                                         target:self
                                       selector:@selector(moveBall)
                                       userInfo:Nil
                                        repeats:YES];
    
   NSRunLoop *runner = [NSRunLoop currentRunLoop];
   [runner addTimer:self.timer forMode: NSDefaultRunLoopMode];
    
}
- (void) moveBall
{
    // [UIView animateWithDuration:0.02 animations:^{
   _alpha -= M_PI/20;
    self.ball.transform = CGAffineTransformMakeRotation(_alpha);
    
    if (_ball.center.x +_sizeBall.width/2 >= _sizeView.width) {
        _vx = -1;
        if (_oldy < _cury) {
            _vy = 1;
        }else _vy = - 1;
    }
    if(_ball.center.y +_sizeBall.height/2 >= _sizeView.height){
        if (_oldx > _curx) {
            _vx = -1;
        }else _vx = 1;
        _vy = -1;
    }
    if (_ball.center.x -_sizeBall.width/2 <= 0) {
        _vx = 1;
        if (_oldy < _cury) {
            _vy = 1;
        }else _vy = - 1;
    }
    if (_ball.center.y -_sizeBall.height/2 <= 0) {
        if (_oldx > _curx) {
            _vx = -1;
        }else _vx = 1;
        _vy = 1;
    }
    _oldx =_ball.center.x;
    _oldy = _ball.center.y;
    _curx =_ball.center.x + _vx*_constBall;
    _cury =_ball.center.y+ _vy*_constBall;
    self.ball.center = CGPointMake(_curx,_cury );
}

@end
