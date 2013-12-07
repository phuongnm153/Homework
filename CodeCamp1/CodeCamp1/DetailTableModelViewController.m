//
//  DetailTableModelViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailTableModelViewController.h"
#import "ModelTableCell.h"
#import "Models.h"
#import "DetailModelViewController.h"

@interface DetailTableModelViewController ()
{
    NSMutableArray *_data,*_tmpData;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation DetailTableModelViewController

static NSString *CellModel = @"CellModel";
@synthesize year_select,tableView;

-(void) initData
{
    //Get DATA
    if(_data) return;
    _data = [NSMutableArray new];
    _tmpData = [NSMutableArray new];
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *year = [NSString stringWithFormat:@"ModelsList%d",(int)self.year_select];
    NSString *staticResourcePath = [mainBundle pathForResource:year ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:staticResourcePath];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [[dictionary allValues] sortedArrayUsingDescriptors:sortDescriptors];
    for (int i = 0;i < [dictionary count];i++) {
        ModelTableCell *model = [[ModelTableCell alloc]
                                initWithName:[[sortedArray objectAtIndex:i] objectForKey:@"Name"]
                                andIcon:[[sortedArray objectAtIndex:i] objectForKey:@"IconFileName"]];
        [_data addObject:model];
    }
    [_tmpData addObjectsFromArray:_data];
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
    self.navigationItem.title = [NSString stringWithFormat:@"Models %d",(int)self.year_select];
    
}
-(void) viewDidLayoutSubviews
{
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
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailModelViewController *model_detail = [[DetailModelViewController alloc] init];
    ModelTableCell *model = (ModelTableCell*)_data[indexPath.row];
    model_detail.year_select = self.year_select;
    model_detail.model_name = model.nameModel.text;
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
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] == 0) {
        [_data removeAllObjects];
        [_data addObjectsFromArray:_tmpData];
    }else{
        [_data removeAllObjects];
        for (int i = 0;i< _tmpData.count;i++) {
            ModelTableCell *model = (ModelTableCell*)_tmpData[i];
            NSRange r = [model.nameModel.text.uppercaseString rangeOfString:searchText.uppercaseString];
            if (r.location != NSNotFound) {
                [_data addObject:model];
            }
        }
    }
    [tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
