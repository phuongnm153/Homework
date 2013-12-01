//
//  ModelsListVC.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ModelsListVC.h"
#import "TableYears.h"
#import "DetailTableModelViewController.h"
@interface ModelsListVC ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_data;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ModelsListVC

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
	// Do any additional setup after loading the view.
    [self setupData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setupData
{
    self.navigationController.navigationItem.title = @"Models";
    if(_data) return;
    _data = [NSMutableArray new];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2008"
                                          andLogo:@"2008"]];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2009"
                                          andLogo:@"2009"]];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2010"
                                          andLogo:@"2010"]];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2011"
                                          andLogo:@"2011"]];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2012"
                                          andLogo:@"2012"]];
    [_data addObject:[[TableYears alloc] initWithName:@"Victoria Secret 2013"
                                          andLogo:@"2013"]];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableModelViewController *model = [[DetailTableModelViewController alloc] init];
    TableYears *year = (TableYears*)_data[indexPath.row];
    model.year_select =(int*)[indexPath row];
    [self.navigationController pushViewController:model
                                         animated:YES];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    TableYears *tableYears = (TableYears*)_data[indexPath.row];
    cell.textLabel.text = tableYears.name;
    cell.imageView.image = tableYears.logo;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
