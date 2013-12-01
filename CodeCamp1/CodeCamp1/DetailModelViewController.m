//
//  DetailModelViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailModelViewController.h"
#import "Models.h"
@interface DetailModelViewController ()
{
    NSMutableArray *_data;
}
@end

@implementation DetailModelViewController
@synthesize model_select;
@synthesize name_model;
@synthesize birthday_model;
@synthesize country_model;
@synthesize height_model;
@synthesize hair_model;
@synthesize eye_model;
@synthesize measurements_model;
@synthesize avarta_model;
@synthesize age_model;
@synthesize occupation_model;
@synthesize years_active_model;
@synthesize rating_model;
@synthesize iconCountry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (UIImage *)imageForRating:(int)rating
{
	switch (rating)
	{
		case 1: return [UIImage imageNamed:@"1StarSmall"];
		case 2: return [UIImage imageNamed:@"2StarsSmall"];
		case 3: return [UIImage imageNamed:@"3StarsSmall"];
		case 4: return [UIImage imageNamed:@"4StarsSmall"];
		case 5: return [UIImage imageNamed:@"5StarsSmall"];
	}
	return nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLayoutConstraint *witdhConstraint =
    [NSLayoutConstraint constraintWithItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.avarta_model
                                 attribute:NSLayoutAttributeWidth
                                multiplier:2
                                  constant:0];
    [self.view addConstraint:witdhConstraint];
    // Do any additional setup after loading the view from its nib.
    [self initData];
    int index = self.model_select;
    Models *model = (Models*)_data[index];
    name_model.text = model.model_name;
    birthday_model.text = model.model_birthday;
    int age = model.model_age;
    age_model.text =[NSString stringWithFormat :@"Age: %d", age];
    occupation_model.text =[NSString stringWithFormat:@"Occupation: %@", model.model_occupation];
    int year =model.model_yearsBegin;
    years_active_model.text =[NSString stringWithFormat:@"Years active: %d", year];
    country_model.text = model.model_country;
    height_model.text =[NSString stringWithFormat:@"Height: %@", model.model_height];
    hair_model.text = [NSString stringWithFormat:@"Hair Color: %@", model.model_haircolor];
    eye_model.text = [NSString stringWithFormat:@"Eye Color: %@", model.model_eyecolor];
    measurements_model.text = model.model_measurements;
    
    NSArray *iconArray = @[@"Brazil",@"Namibia",@"United States"];
    int icon =[iconArray indexOfObject:model.model_country];
    switch(icon)
    {
        case 0:
            iconCountry.image = [UIImage imageNamed:@"br"];
            break;
        case 1:
            iconCountry.image = [UIImage imageNamed:@"na"];
            break;
        case 2:
            iconCountry.image = [UIImage imageNamed:@"us"];
            break;
    }
    
    rating_model.image = [self imageForRating:model.model_rating];
    NSURL *imageURL = [NSURL URLWithString:model.model_avatar];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    avarta_model.image = [UIImage imageWithData:imageData];
}
-(void) viewDidLayoutSubviews
{
    
}
-(void) initData
{
    if(_data) return;
    _data = [NSMutableArray new];
    [_data addObject:[[Models alloc] initWithName:@"Adriana Lima"
                                      andBirthday:@"12/06/1981"
                                       andCountry:@"Brazil"
                                           andAge:32
                                    andOccupation:@"Model"
                                     andYearBegin:2000
                                        andHeight:@"1m78"
                                     andHairColor:@"Black"
                                      andEyeColor:@"Brown"
                                  andMeasurements:@"86-61-89"
                                        andAvatar:@"http://static.ngankeo.vn/full/2013/11/16/nhung-guong-mat-thien-than-khong-the-thieu-cua-victorias-secret-1030210440a938be3ff849c87dc42a510dd467a6.jpg"
                                        andRating:5]];
    [_data addObject:[[Models alloc] initWithName:@"Alessandra Ambrosio"
                                      andBirthday:@"11/4/1981"
                                       andCountry:@"Brazil"
                                           andAge:21
                                    andOccupation:@"Model"
                                     andYearBegin:1996
                                        andHeight:@"1m77"
                                     andHairColor:@"Brown"
                                      andEyeColor:@"Brown"
                                  andMeasurements:@"86-64-87"
                                        andAvatar:@"http://static.ngankeo.vn/full/2013/11/16/nhung-guong-mat-thien-than-khong-the-thieu-cua-victorias-secret-6796056b81639be533a86a27cd2b56d700dc1083.jpg"
                                        andRating:4]];
    [_data addObject:[[Models alloc] initWithName:@"Candice Swanepoel"
                                      andBirthday:@"20/10/1988"
                                       andCountry:@"South Africa"
                                           andAge:21
                                    andOccupation:@"Model"
                                     andYearBegin:2007
                                        andHeight:@"1m75 "
                                     andHairColor:@"Blonde"
                                      andEyeColor:@"Blue"
                                  andMeasurements:@"84-59-88"
                                        andAvatar:@"http://static.ngankeo.vn/full/2013/11/16/nhung-guong-mat-thien-than-khong-the-thieu-cua-victorias-secret-f43a0906545ba56fffb0a7e780e1c674e35135ba.jpg"
                                        andRating:4]];
    [_data addObject:[[Models alloc] initWithName:@"Doutzen Kroes"
                                      andBirthday:@"23/01/1985"
                                       andCountry:@"Netherlands"
                                           andAge:28
                                    andOccupation:@"Model"
                                     andYearBegin:2008
                                        andHeight:@"1m75"
                                     andHairColor:@"Blonde"
                                      andEyeColor:@"Blue"
                                  andMeasurements:@"86-62-88"
                                        andAvatar:@"http://static.ngankeo.vn/full/2013/11/16/nhung-guong-mat-thien-than-khong-the-thieu-cua-victorias-secret-3d8ba4184a09076ec9df17e33c0681c5d23569e2.jpg"
                                        andRating:4]];
    [_data addObject:[[Models alloc] initWithName:@"Karlie Kloss"
                                      andBirthday:@"3/8/1992"
                                       andCountry:@"United States"
                                           andAge:21
                                    andOccupation:@"Model"
                                     andYearBegin:2007
                                        andHeight:@"1m84"
                                     andHairColor:@"Dark blonde"
                                      andEyeColor:@"Hazel"
                                  andMeasurements:@"81-58-84"
                                        andAvatar:@"http://static.ngankeo.vn/full/2013/11/16/nhung-guong-mat-thien-than-khong-the-thieu-cua-victorias-secret-b5641a785362148523ec35ac12b93cdf0c9be46e.jpg"
                                        andRating:4]];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
