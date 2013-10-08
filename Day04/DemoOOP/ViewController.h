//
//  ViewController.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "Scene.h"
#import "Cat.h"
#import "Tiger.h"
@interface ViewController : UIViewController
@property(nonatomic, strong) GameManager *gameManager;
@property(nonatomic,strong) Scene *scene;
@property(nonatomic,strong) Cat *cat;
@property(nonatomic,strong) Tiger *tiger;
@end
