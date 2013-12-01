//
//  ImagesListVC.m
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ImagesListVC.h"
#import "TableYears.h"
#import "DetailImageViewController.h"
@interface ImagesListVC ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_data;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ImagesListVC

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
    [self setupData];
	// Do any additional setup after loading the view.
    self.navigationController.navigationItem.title = @"Images";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) setupData
{
    self.navigationController.navigationItem.title = @"Images";
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
    DetailImageViewController *img_detail = [[DetailImageViewController alloc] init];
    img_detail.imgIndex =(int*)[indexPath row];
    [self.navigationController pushViewController:img_detail
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
    TableYears *img = (TableYears*)_data[indexPath.row];
    cell.textLabel.text = img.name;
    cell.imageView.image = img.logo;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
