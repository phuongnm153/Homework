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
    NSArray *_data;
}

@end

@implementation ViewController
@synthesize tableView,scrollView,imageView,pageControl;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _data = @[@"Ratman 1-01.jpg",@"Ratman 1-02.jpg", @"Ratman 1-03.jpg", @"Ratman 1-04.jpg", @"Ratman 1-05.jpg", @"Ratman 1-06.jpg",@"Ratman 1-07.jpg",@"Ratman 1-08.jpg",@"Ratman 1-09.jpg",@"Ratman 2-01.jpg",@"Ratman 2-02.jpg", @"Ratman 2-03.jpg", @"Ratman 2-04.jpg", @"Ratman 2-05.jpg", @"Ratman 2-06.jpg",@"Ratman 2-07.jpg",@"Ratman 2-08.jpg",@"Ratman 2-09.jpg"];
    self.scrollView.delegate = self;
    float sWidth = self.scrollView.bounds.size.width;
    float sHeight = self.scrollView.bounds.size.height;
    self.scrollView.contentSize = CGSizeMake(9 * sWidth, sHeight);
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = 9;
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
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString  stringWithFormat:@"Chapter %d", [indexPath row]+1];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageIndex =  self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    self.pageControl.currentPage = pageIndex;
}
@end
