//
//  GameManager.m
//  DemoOOP
//
//  Created by iOS18 on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "GameManager.h"
@implementation GameManager

-(id) initWithCoin:(int) startingCoins
{
    // Trien khai code
    self = [super init];
    if (self) {
        self.coinAmount = startingCoins;
    }
    return self;
}

-(void) purchaseCoin:(int)  numberOfCoin
{
    // Trien khai code
    self.coinAmount = self.coinAmount - numberOfCoin;    
}
-(void) strartGame
{
}
-(void) pauseGame
{
    
}
-(void) resumeGame
{
    
}
-(void) endGame
{
    
}
@end
