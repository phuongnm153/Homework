//
//  DetailModelViewController.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailModelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name_model;
@property (weak, nonatomic) IBOutlet UILabel *birthday_model;
@property (weak, nonatomic) IBOutlet UILabel *age_model;
@property (weak, nonatomic) IBOutlet UILabel *occupation_model;
@property (weak, nonatomic) IBOutlet UILabel *years_active_model;
@property (weak, nonatomic) IBOutlet UILabel *country_model;
@property (weak, nonatomic) IBOutlet UILabel *height_model;
@property (weak, nonatomic) IBOutlet UILabel *hair_model;
@property (weak, nonatomic) IBOutlet UILabel *eye_model;
@property (weak, nonatomic) IBOutlet UILabel *measurements_model;
@property (weak, nonatomic) IBOutlet UIImageView *avarta_model;
@property (weak, nonatomic) IBOutlet UIImageView *rating_model;
@property (weak, nonatomic) IBOutlet UIImageView *iconCountry;
@property(nonatomic, assign) NSInteger *model_select;

@end
