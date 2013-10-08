//
//  GameManager.h
//  DemoOOP
//
//  Created by iOS18 on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject
@property(nonatomic, assign) int currentLevel;
@property(nonatomic,assign) int coinAmount;
-(id) initWithCoin:(int) startingCoins;
-(void) purchaseCoin:(int)  numberOfCoin;

-(void) strartGame;
-(void) pauseGame;
-(void) resumeGame;
-(void) endGame;

@end
