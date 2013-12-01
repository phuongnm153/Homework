//
//  DetailImageViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/27/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailImageViewController.h"
#import "Reachability.h"
@interface DetailImageViewController ()
{
    NSArray *_data2008;
    NSArray *_data2009;
    NSArray *_data2010;
    NSArray *_data2011;
    NSArray *_data2012;
    NSArray *_data2013;
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation DetailImageViewController
@synthesize NameDetailImage,scrollView,pageControl,imgIndex;


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
-(void) initArray{
    self.navigationController.navigationItem.title = @"Images";
    _data2008 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/3401329.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/5710478.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/3729241.jpg"];
    _data2009 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/2030149.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/9898964.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/4752108.jpg"];
    _data2010 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/9718655.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/906980.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/6693065.jpg"];
    _data2011 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/3078526.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/9703581.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/1231271.jpg"];
    _data2012 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/7156028.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/6856189.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/2706398.jpg"];
    _data2013 = @[@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/3332802.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/2722975.jpg",@"http://elitewallpapers.weebly.com/uploads/6/0/5/6/6056927/7121126.jpg"];
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
    float sWidth, sHeight;
    self.scrollView.delegate = self;
    sWidth = self.scrollView.bounds.size.width;
    sHeight = self.scrollView.bounds.size.height;
    
    NSMutableArray *_arr = [NSMutableArray new];
    switch (indexYear) {
        case 0:
            [_arr addObjectsFromArray:_data2008];
            break;
        case 1:
            [_arr addObjectsFromArray:_data2009];
            break;
        case 2:
            [_arr addObjectsFromArray:_data2010];
            break;
        case 3:
            [_arr addObjectsFromArray:_data2011];
            break;
        case 4:
            [_arr addObjectsFromArray:_data2012];
            break;
        default:
            [_arr addObjectsFromArray:_data2013];
            break;
    }
    self.scrollView.contentSize = CGSizeMake([_arr count] * sWidth, sHeight);
    int count =0;
    for (int i=0; i<_data2008.count; i++) {
        NSURL *imageURL = [NSURL URLWithString:_arr[i]];
        
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];

        imageView.frame = CGRectMake(count * sWidth, 0, sWidth, sHeight);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
        count ++;
    }
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = [_data2008 count];
    [scrollView setContentOffset:CGPointMake(0,0) animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    activityIndicator.frame = CGRectMake(140, 236, 37, 37);
//    [activityIndicator startAnimating];
//    [self.view addSubview:activityIndicator];
//    self.view.userInteractionEnabled = NO;
    [self initArray];
    if ([self connectedToNetwork]) {
        [self LoadData];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection"
                                                        message:@"Please check your internet connection and try again."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    NameDetailImage.hidden = TRUE;
}
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    [activityIndicator stopAnimating];
//    [activityIndicator removeFromSuperview];
//    self.view.userInteractionEnabled = YES;
//}
-(void) viewDidLayoutSubviews{
    if ([self connectedToNetwork]) {
        [self LoadData];
    }
}
-(void) LoadData{
    [self initScrollView];
    //int f = self.imgIndex;
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
