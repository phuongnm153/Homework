//
//  Scene.h
//  DemoOOP
//
//  Created by iOS18 on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "GameManager.h"

@interface Scene : GameManager
@property(nonatomic, assign) int level;
@property(nonatomic, assign) float price;
@property(nonatomic, strong)   NSMutableArray *animal;
@property(nonatomic, strong) NSMutableArray *background; //Chua cac anh nen

@end
