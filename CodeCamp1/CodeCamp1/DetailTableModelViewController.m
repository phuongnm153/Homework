//
//  DetailTableModelViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailTableModelViewController.h"
#import "ModelTableCell.h"
#import "DetailModelViewController.h"

@interface DetailTableModelViewController ()
{
    NSMutableArray *_data;
}
@end

@implementation DetailTableModelViewController

static NSString *CellModel = @"CellModel";
@synthesize year_select,tableView;

-(void) initData
{
    //Get DATA
    if(_data) return;
    _data = [NSMutableArray new];
    [_data addObject:[[ModelTableCell alloc] initWithName:@"Adriana Lima"
                                                  andIcon:@"2013_Adriana_Lima"
                                               andCountry:@"Brazil"]];
    [_data addObject:[[ModelTableCell alloc] initWithName:@"Alessandra Ambrosio"
                                                  andIcon:@"2013_Alessandra_Ambrosio"
                                               andCountry:@"Brazil"]];
    [_data addObject:[[ModelTableCell alloc] initWithName:@"Candice Swanepoel"
                                                  andIcon:@"2013_Candice_Swanepoel"
                                               andCountry:@"South Africa"]];
    [_data addObject:[[ModelTableCell alloc] initWithName:@"Doutzen Kroes"
                                                  andIcon:@"2013_Doutzen_Kroes"
                                               andCountry:@"Netherlands"]];
    [_data addObject:[[ModelTableCell alloc] initWithName:@"Karlie Kloss"
                                                  andIcon:@"2008_lily"
                                               andCountry:@"United States"]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    int year =self.year_select;
    self.navigationItem.title = [NSString stringWithFormat:@"Models %d",year+2008];
    [self initData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellModel];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellModel];
    }
    ModelTableCell *model = (ModelTableCell*)_data[indexPath.row];
    cell.textLabel.text = model.nameModel.text;
    cell.imageView.image = model.iconModel.image;
//    ModelTableCell *cell = (ModelTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellModel forIndexPath:indexPath];
//    
//    // Configure Cell
//    ModelTableCell *model = (ModelTableCell*) _data[indexPath.row];
//    [cell.nameModel setText:[NSString stringWithFormat:@"%@", model.nameModel]];
//    [cell.countryModel setText:[NSString stringWithFormat:@"%@", model.countryModel]];
//    cell.iconModel = model.iconModel;
//    cell.iconModel.layer.masksToBounds = YES;
//    cell.iconModel.layer.cornerRadius = 5.0;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailModelViewController *model_detail = [[DetailModelViewController alloc] init];
    model_detail.model_select = indexPath.row;
    // Detai Model
    [self.navigationController pushViewController:model_detail animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70.0f;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
