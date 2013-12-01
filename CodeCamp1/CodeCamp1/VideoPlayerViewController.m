//
//  VideoPlayerViewController.m
//  VictoriaD
//
//  Created by LongDTMacBook on 11/26/13.
//  Copyright (c) 2013 PhuongNM. All rights reserved.
//

#import "VideoPlayerViewController.h"

@interface VideoPlayerViewController ()
{
    MPMoviePlayerController *moviePlayer;
    UIWebView *_videoView;
}
@end

@implementation VideoPlayerViewController
@synthesize video_play_select;
@synthesize video_url;

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
    self.navigationController.navigationItem.title = @"Videos";
    // Do any additional setup after loading the view from its nib.
    //[self playVideo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) playVideo
{
    [_videoView removeFromSuperview];
    _videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60)];
    _videoView.backgroundColor = [UIColor clearColor];
    _videoView.opaque = NO;
    [self.view addSubview:_videoView];
    
    
    NSString *videoHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <head>\
                           <style type=\"text/css\">\
                           iframe {position:absolute; top:50%%; margin-top:-130px;}\
                           body {background-color:#000; margin:0;}\
                           </style>\
                           </head>\
                           <body>\
                           <iframe width=\"100%%\" height=\"240px\" src=\"%@\" frameborder=\"0\" allowfullscreen></iframe>\
                           </body>\
                           </html>", video_url];
    
    [_videoView loadHTMLString:videoHTML baseURL:nil];
}
-(void) viewDidLayoutSubviews{
    [self playVideo];
}
@end
