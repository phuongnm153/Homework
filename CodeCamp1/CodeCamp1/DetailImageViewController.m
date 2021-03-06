//
//  DetailImageViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailImageViewController.h"
#import "Reachability.h"
#import "HUD.h"
@interface DetailImageViewController ()
{
    NSMutableArray *_arr;
    BOOL _firstLoad;
}
@end

@implementation DetailImageViewController
@synthesize scrollView,pageControl,imgIndex;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageIndex =  self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    self.pageControl.currentPage = pageIndex;
}

- (BOOL) connectedToNetwork{
    Reachability* reachability = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        return NO;
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        return TRUE;
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    {
        return TRUE;
    }
    return NO;
}
-(void) loadScrollView:(NSInteger) indexYear
{
    _arr = [NSMutableArray new];
    float sWidth, sHeight;
    sWidth = self.view.bounds.size.width;
    sHeight = self.view.bounds.size.height;
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *staticResourcePath = [mainBundle pathForResource:@"ImagesList" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:staticResourcePath];
    [_arr addObjectsFromArray:dictionary[[NSString stringWithFormat:@"%d",indexYear+2008]]];
    
    self.scrollView.contentSize = CGSizeMake([_arr count] * sWidth, sHeight);
    int count =0;
    for (int i=0; i<_arr.count; i++) {
        NSURL *imageURL = [NSURL URLWithString:_arr[i]];
        
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];

        imageView.frame = CGRectMake(count * sWidth, 0, sWidth, sHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
        count ++;
    }
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = [_arr count];
    [scrollView setContentOffset:CGPointMake(0,0) animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"Images";
    _firstLoad = TRUE;
    if ([self connectedToNetwork])
    {
        [HUD showUIBlockingIndicatorWithText:@"Loading..."];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self LoadData];
                
                [HUD hideUIBlockingIndicator];
            });
            
        });
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection"
                                                        message:@"Please check your internet connection and try again."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void) viewDidLayoutSubviews{
    if (!_firstLoad) {
        [self LoadData];
    }
    _firstLoad = FALSE;
}
-(void) LoadData{
    [self initScrollView];
    [self loadScrollView:imgIndex];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initScrollView
{
    NSArray *subviews = [[self.scrollView subviews] copy];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    CGPoint pt;
    pt.x = 0;
    pt.y = 0;
    [self.scrollView setContentOffset:pt];
}
@end
