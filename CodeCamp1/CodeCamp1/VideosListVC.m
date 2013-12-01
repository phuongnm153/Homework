//
//  VideosListVC.m
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "VideosListVC.h"
#import "Videos.h"
#import "VideoPlayerViewController.h"

@interface VideosListVC ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_data;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation VideosListVC

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
    self.navigationController.navigationItem.title = @"Videos";
    if(_data) return;
    _data = [NSMutableArray new];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2008"
                                          andLogo:@"2008"
                                          andLink:@"http://www.youtube.com/embed/JOKfhKkyyPw"]];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2009"
                                          andLogo:@"2009"
                                          andLink:@"http://www.youtube.com/embed/MsMoi5VtKJE"]];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2010"
                                          andLogo:@"2010"
                                          andLink:@"http://www.youtube.com/embed/4w9wLwli6t0"]];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2011"
                                          andLogo:@"2011"
                                          andLink:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"]];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2012"
                                          andLogo:@"2012"
                                          andLink:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"]];
    [_data addObject:[[Videos alloc] initWithName:@"Victoria Secret 2013"
                                          andLogo:@"2013"
                                          andLink:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"]];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoPlayerViewController *video_detail = [[VideoPlayerViewController alloc] init];
    video_detail.video_url = ((Videos*)_data[indexPath.row]).url;
    [self.navigationController pushViewController:video_detail
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
    Videos *video = (Videos*)_data[indexPath.row];
    cell.textLabel.text = video.name;
    cell.imageView.image = video.logo;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
