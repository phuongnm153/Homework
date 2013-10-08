//
//  ViewController.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentCoin;
@property (weak, nonatomic) IBOutlet UIButton *btnMeomuop;
@property (weak, nonatomic) IBOutlet UILabel *lblMesseger;
@property (weak, nonatomic) IBOutlet UIButton *btnTiger;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Khoi tao Game Manager, bo xung cac scene, khi khoi tao scene
    _gameManager = [[GameManager alloc] initWithCoin:(1000)];
    _lblCurrentCoin.text = [NSString stringWithFormat:@"%d", [_gameManager coinAmount]];
    _cat = [[Cat alloc] initWithName:@"Meo muop" andOrigin:@"Viet Nam" andPrice:100];
    _tiger=[[Tiger alloc] initWithName:@"Siberia Tiger" andOrigin:@"Russia" andPrice:200];
    [_btnMeomuop setTitle:[NSString stringWithFormat:@"%@ price :%d",[_cat name],[_cat priceAnimal]] forState:UIControlStateNormal];
    [_btnTiger setTitle:[NSString stringWithFormat:@"%@ price :%d",[_tiger name],[_tiger priceAnimal]] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnMeomuop:(id)sender {
    if(_gameManager.coinAmount>=_cat.priceAnimal)
    {
        _cat->_voice=[NSMutableArray arrayWithObjects:@"Meo meo",@"me me", nil];
        [_cat sound];
        [_gameManager purchaseCoin:(int) [_cat priceAnimal]];
        _lblCurrentCoin.text = [NSString stringWithFormat:@"%d", [_gameManager coinAmount]];
        _lblMesseger.text = [NSString stringWithFormat:@"You just spend $ %d.",[_cat priceAnimal]];
    }else{
        _lblMesseger.text = @"Not Enough Money!";
    }
    
}
- (IBAction)btnTiger:(id)sender {
    if(_gameManager.coinAmount>=_tiger.priceAnimal){
        _tiger.origin = @"Siberia, Russia";
        
        _tiger->_id = @"012445";
        [_gameManager purchaseCoin:(int) [_tiger priceAnimal]];
        
        _lblCurrentCoin.text = [NSString stringWithFormat:@"%d", [_gameManager coinAmount]];
        _tiger->_voice=[NSMutableArray arrayWithObjects:@"Oar",@"Krr",@"AA", nil];
        [_tiger sound];
        _lblMesseger.text =[NSString stringWithFormat: @"You just spend $ %d.",[_tiger priceAnimal]];
    }else{
        _lblMesseger.text = @"Not Enough Money!";
    }
}
- (IBAction)demoInit:(id)sender {
    

}

@end
