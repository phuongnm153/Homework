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
}
-(void) viewDidLayoutSubviews
{
    //[self.tableView reloadData];
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
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *staticResourcePath = [mainBundle pathForResource:@"Years" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:staticResourcePath];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [[dictionary allValues] sortedArrayUsingDescriptors:sortDescriptors];
    for (int i = 0;i < [dictionary count];i++) {
        TableYears *year = [[TableYears alloc]
                            initWithName:[[sortedArray objectAtIndex:i] objectForKey:@"Name"]
                            andLogo:[[sortedArray objectAtIndex:i] objectForKey:@"Logo"]];
        [_data addObject:year];
    }
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
    TableYears *year = (TableYears*)_data[indexPath.row];
    cell.textLabel.text = year.name;
    cell.imageView.image = year.logo;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
