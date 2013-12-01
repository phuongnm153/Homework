//
//  ViewController.m
//  Day13
//
//  Created by MAC on 11/9/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_data,*_arr;
    NSMutableArray *_displayArr;
}

@end

@implementation ViewController

@synthesize tableView,scrollView,imageView,pageControl,searchBar;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _data = @[@"Ratman 1-01.jpg",@"Ratman 1-02.jpg", @"Ratman 1-03.jpg", @"Ratman 1-04.jpg", @"Ratman 1-05.jpg", @"Ratman 1-06.jpg",@"Ratman 1-07.jpg",@"Ratman 1-08.jpg",@"Ratman 1-09.jpg",@"Ratman 2-01.jpg",@"Ratman 2-02.jpg", @"Ratman 2-03.jpg", @"Ratman 2-04.jpg", @"Ratman 2-05.jpg", @"Ratman 2-06.jpg",@"Ratman 2-07.jpg",@"Ratman 2-08.jpg",@"Ratman 2-09.jpg",@"Ratman 3-01.jpg",@"Ratman 3-02.jpg", @"Ratman 3-03.jpg", @"Ratman 3-04.jpg", @"Ratman 3-05.jpg", @"Ratman 3-06.jpg",@"Ratman 3-07.jpg",@"Ratman 3-08.jpg",@"Ratman 3-09.jpg"];
    self.scrollView.delegate = self;
    float sWidth = self.scrollView.bounds.size.width;
    float sHeight = self.scrollView.bounds.size.height;
    self.scrollView.contentSize = CGSizeMake(9 * sWidth, sHeight);
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = 9;
    _arr = [[NSArray alloc] initWithObjects:@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 1",@"Chapter 2",@"Chapter 3",@"Chapter 5",@"Chapter 6",@"Chapter 7", nil];
    _displayArr = [[NSMutableArray alloc] initWithArray:_arr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_displayArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [_displayArr objectAtIndex:indexPath.row];
    return cell;
}
-(void) incsizeScrollView{
    float sWidth = self.view.bounds.size.width;
    float sHeight = self.view.bounds.size.height - 45;
    self.scrollView.contentSize = CGSizeMake(9 * sWidth, sHeight);
    CGRect uiview2_original_rect = scrollView.frame;
    
    CGRect uiview1_resized_rect = CGRectMake(0,
                                             uiview2_original_rect.origin.y,
                                             0,0);
    CGRect uiview2_resized_rect = CGRectMake(0,
                                             uiview2_original_rect.origin.y,
                                             self.view.bounds.size.width,
                                             uiview2_original_rect.size.height);
    [UIView animateWithDuration:0.50 delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                        tableView.frame = uiview1_resized_rect;
                         scrollView.frame = uiview2_resized_rect;
                     } completion:^(BOOL finished) {
                         
                     }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self incsizeScrollView];
    NSArray *subviews = [[self.scrollView subviews] copy];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    CGPoint pt;
    pt.x = 0;
    pt.y = 0;
    [self.scrollView setContentOffset:pt];
	float sWidth = self.scrollView.bounds.size.width;
    float sHeight = self.scrollView.bounds.size.height;
    int count = 0;
    for (int i =[indexPath row]*9;i<([indexPath row]+1)*9;i++) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_data[i]]];
        image.frame = CGRectMake(count * sWidth, 0, sWidth, sHeight);
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:image];
        count ++;
    }
}
- (IBAction)itemsList:(id)sender {
    float sWidth = self.view.bounds.size.width - 296;
    float sHeight = self.view.bounds.size.height - 45;
    self.scrollView.contentSize = CGSizeMake(9 * sWidth, sHeight);
    CGRect uiview2_original_rect = scrollView.frame;
    
    CGRect uiview1_resized_rect = CGRectMake(0,
                                            uiview2_original_rect.origin.y,
                                            288,
                                            self.view.bounds.size.height - uiview2_original_rect.origin.y);
    
    CGRect uiview2_resized_rect = CGRectMake(296,
                                             uiview2_original_rect.origin.y,
                                             self.view.bounds.size.width - 296,
                                             uiview2_original_rect.size.height);

    [UIView animateWithDuration:0.50 delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         scrollView.frame = uiview2_resized_rect;
                         tableView.frame = uiview1_resized_rect;
                     } completion:^(BOOL finished) {
                         
                     }];
    [tableView reloadData];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] == 0) {
        [_displayArr removeAllObjects];
        [_displayArr addObjectsFromArray:_arr];
    }else{
        [_displayArr removeAllObjects];
        for (NSString *str in _arr) {
            NSRange r = [str rangeOfString:searchText];
            if (r.location != NSNotFound) {
                [_displayArr addObject:str];
            }
        }
    }
    [tableView reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageIndex =  self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    self.pageControl.currentPage = pageIndex;
}
@end
