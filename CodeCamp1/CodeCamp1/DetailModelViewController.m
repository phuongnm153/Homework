//
//  DetailModelViewController.m
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailModelViewController.h"
#import "Models.h"
#import "Reachability.h"
#import "HUD.h"
#import "ModelRate.h"
#import "VideoPlayerViewController.h"
#import "ModelimageDetail.h"
@interface DetailModelViewController ()
{
    NSMutableArray *_data;
    BOOL _firstRate;
    float oldRating,localRating;
    NSString *_videoUrl,*_imgModelname;
}
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) IBOutlet UIButton *watchPhoto;
@property (weak, nonatomic) IBOutlet UIButton *watchVideo;
@end

@implementation DetailModelViewController
@synthesize avarta_model,imgInfoModel,model_name,rateView,year_select;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (UIImage *)imageForRating:(int)rating
{
	switch (rating)
	{
		case 1: return [UIImage imageNamed:@"1StarSmall"];
		case 2: return [UIImage imageNamed:@"2StarsSmall"];
		case 3: return [UIImage imageNamed:@"3StarsSmall"];
		case 4: return [UIImage imageNamed:@"4StarsSmall"];
		case 5: return [UIImage imageNamed:@"5StarsSmall"];
	}
	return nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _watchPhoto.hidden = TRUE;
    _watchVideo.hidden=TRUE;
    _btnLike.hidden = TRUE;
    _btnShare.hidden = TRUE;
    _firstRate = TRUE;
    if ([self connectedToNetwork])
    {
        [HUD showUIBlockingIndicatorWithText:@"Loading..."];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLayoutConstraint *witdhConstraint =
                [NSLayoutConstraint constraintWithItem:self.view
                                             attribute:NSLayoutAttributeWidth
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.avarta_model
                                             attribute:NSLayoutAttributeWidth
                                            multiplier:2
                                              constant:0];
                [self.view addConstraint:witdhConstraint];
                [self loadRate];
                [self initData];
                _watchPhoto.hidden=FALSE;
                _watchVideo.hidden=FALSE;
                _btnLike.hidden = FALSE;
                _btnShare.hidden = FALSE;
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
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    //self.statusLabel.text = [NSString stringWithFormat:@"Rating: %f", rating];
    if (_firstRate) {
        localRating = rating;
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Rating this model"
                                                     message:@"Are you sure rating for this model?"
                                                    delegate:self
                                           cancelButtonTitle:@"No"
                                           otherButtonTitles:@"Yes", nil];
        
        [av show];
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        [self writeFileModelRate:localRating];
        _firstRate = FALSE;
    }else
    {
        self.rateView.rating = oldRating;
    }
}
- (void) writeFileModelRate:(float)rating{
    
    //  Bây giờ lưu lại thông tin của car và một file nào đó
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *year = [NSString stringWithFormat:@"ModelsRate%d",(int)self.year_select];
    NSString *rateFile = [documentPath stringByAppendingPathComponent:year];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *dic = [NSMutableDictionary new];

    if ([fileManager fileExistsAtPath:rateFile]){
    //  Lấy ra dictionary biểu diễn các thông tin của car và lưu vào file
        NSDictionary *dictionary  = [NSDictionary dictionaryWithContentsOfFile:rateFile];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray = [[dictionary allValues] sortedArrayUsingDescriptors:sortDescriptors];
        
        for (int i = 0;i < [dictionary count];i++) {
            NSDictionary *tmp = [NSDictionary new];
            float clicks =[[[sortedArray objectAtIndex:i] objectForKey:@"sumClicks"] floatValue];
            float scores =[[[sortedArray objectAtIndex:i] objectForKey:@"sumScores"] floatValue];
            if ([[[sortedArray objectAtIndex:i] objectForKey:@"Name"] isEqualToString:self.model_name]) {
                clicks = clicks +1;
                scores = scores+rating;
                self.rateView.rating =lroundf(scores/clicks);
            }
            tmp = @{@"Name": [[sortedArray objectAtIndex:i] objectForKey:@"Name"],
                     @"sumClicks": @(clicks),
                     @"sumScores": @(scores)};
            [dic setObject:tmp forKey:[[sortedArray objectAtIndex:i] objectForKey:@"Name"]];
        }
    }else{
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *year = [NSString stringWithFormat:@"ModelsList%d",(int)self.year_select];
        NSString *staticResourcePath = [mainBundle pathForResource:year ofType:@"plist"];
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:staticResourcePath];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray = [[dictionary allValues] sortedArrayUsingDescriptors:sortDescriptors];
        
        for (int i = 0;i < [dictionary count];i++) {
            NSDictionary *tmp = [NSDictionary new];
            if ([[[sortedArray objectAtIndex:i] objectForKey:@"Name"] isEqualToString:self.model_name]) {
                tmp = @{@"Name": [[sortedArray objectAtIndex:i] objectForKey:@"Name"],
                                      @"sumClicks": @(1),
                                      @"sumScores": @(rating)};
                self.rateView.rating = rating;
            }else{
            tmp = @{@"Name": [[sortedArray objectAtIndex:i] objectForKey:@"Name"],
                                  @"sumClicks": @(0),
                                  @"sumScores": @(0)};
            }
            [dic setObject:tmp forKey:[[sortedArray objectAtIndex:i] objectForKey:@"Name"]];
        }
    }
    
    [dic writeToFile:rateFile atomically:YES];

}

- (void) readFileModelRate{
    //  Lấy ra file đã lưu trữ và truyền vào đọc bằng dictionary
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *year = [NSString stringWithFormat:@"ModelsRate%d",(int)self.year_select];
    NSString *rateFile = [documentPath stringByAppendingPathComponent:year];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:rateFile]){
        NSDictionary *dictionary  = [NSDictionary dictionaryWithContentsOfFile:rateFile];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray = [[dictionary allValues] sortedArrayUsingDescriptors:sortDescriptors];
        for (int i = 0;i < [dictionary count];i++) {
            if ([[[sortedArray objectAtIndex:i] objectForKey:@"Name"] isEqualToString:self.model_name]) {
                float clicks =[[[sortedArray objectAtIndex:i] objectForKey:@"sumClicks"] floatValue];
                float scores =[[[sortedArray objectAtIndex:i] objectForKey:@"sumScores"] floatValue];
                NSLog(@"%ld",lroundf(scores/clicks));
                self.rateView.rating =lroundf(scores/clicks);                
            }
        }
    }
    else{
        self.rateView.rating = 0;
    }
    oldRating = self.rateView.rating;
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
-(void) viewDidLayoutSubviews
{
    
}
//- (BOOL)shouldAutorotate
//{
//    return NO; //cho phép điều chỉnh giao diện
//    //return NO sẽ không gọi các hàm viewWillLayoutSubviews và viewDidLayoutSubviews
//}
//- (NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait ;
//}
-(void) loadRate
{
    self.rateView.notSelectedImage = [UIImage imageNamed:@"star_0.jpg"];
    //self.rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"star.png"];
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    [self readFileModelRate];
}
-(void) initData
{
    if(_data) return;
    _data = [NSMutableArray new];
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *year = [NSString stringWithFormat:@"ModelsList%d",(int)self.year_select];
    NSString *staticResourcePath = [mainBundle pathForResource:year ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:staticResourcePath];
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:dictionary[self.model_name]];
    
    Models *model = [[Models alloc]initWithName:dic[@"Name"]
                                        andIcon:dic[@"IconFileName"]
                                        andInfo:dic[@"ImgInfo"]
                                      andAvatar:dic[@"AvaFileUrl"]
                                      andRating:dic[@"VideoUrl"]];
    _videoUrl = model.model_video;
    _imgModelname = model.model_name;
    self.imgInfoModel.image = [UIImage imageNamed:model.model_info];
    NSURL *imageURL = [NSURL URLWithString:model.model_avatar];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    avarta_model.image = [UIImage imageWithData:imageData];
    [self loadView1];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id)init
{
	self = [super init];
	if(self){
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:)
													 name:UIKeyboardWillHideNotification
												   object:nil];
	}
	
	return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView1 {
	
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, 320, 40)];
    
	textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(6, 3, 240, 40)];
    textView.isScrollable = NO;
    textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
	textView.minNumberOfLines = 1;
	textView.maxNumberOfLines = 6;
    // you can also set the maximum height in points with maxHeight
    // textView.maxHeight = 200.0f;
	textView.returnKeyType = UIReturnKeyGo; //just as an example
	textView.font = [UIFont systemFontOfSize:15.0f];
	textView.delegate = self;
    textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    textView.backgroundColor = [UIColor whiteColor];
    textView.placeholder = @"Type to see the textView grow!";
    
    // textView.text = @"test\n\ntest";
	// textView.animateHeightChange = NO; //turns off animation
    
    [self.view addSubview:containerView];
	
    UIImage *rawEntryBackground = [UIImage imageNamed:@"MessageEntryInputField.png"];
    UIImage *entryBackground = [rawEntryBackground stretchableImageWithLeftCapWidth:13 topCapHeight:22];
    UIImageView *entryImageView = [[UIImageView alloc] initWithImage:entryBackground];
    entryImageView.frame = CGRectMake(5, 0, 248, 40);
    entryImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIImage *rawBackground = [UIImage imageNamed:@"MessageEntryBackground.png"];
    UIImage *background = [rawBackground stretchableImageWithLeftCapWidth:13 topCapHeight:22];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
    imageView.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height);
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    // view hierachy
    [containerView addSubview:imageView];
    [containerView addSubview:textView];
    [containerView addSubview:entryImageView];
    
    UIImage *sendBtnBackground = [[UIImage imageNamed:@"MessageEntrySendButton.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    UIImage *selectedSendBtnBackground = [[UIImage imageNamed:@"MessageEntrySendButton.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    
	UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	doneBtn.frame = CGRectMake(containerView.frame.size.width - 69, 8, 63, 27);
    doneBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
	[doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    
    [doneBtn setTitleShadowColor:[UIColor colorWithWhite:0 alpha:0.4] forState:UIControlStateNormal];
    doneBtn.titleLabel.shadowOffset = CGSizeMake (0.0, -1.0);
    doneBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[doneBtn addTarget:self action:@selector(resignTextView) forControlEvents:UIControlEventTouchUpInside];
    [doneBtn setBackgroundImage:sendBtnBackground forState:UIControlStateNormal];
    [doneBtn setBackgroundImage:selectedSendBtnBackground forState:UIControlStateSelected];
	[containerView addSubview:doneBtn];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

-(void)resignTextView
{
	[textView resignFirstResponder];
}

//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note{
    // get keyboard size and loctaion
	CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
	// get a rect for the textView frame
	CGRect containerFrame = containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
	
	// set views with new info
	containerView.frame = containerFrame;
    
	
	// commit animations
	[UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
	
	// get a rect for the textView frame
	CGRect containerFrame = containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
	
	// animations settings
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
	// set views with new info
	containerView.frame = containerFrame;
	
	// commit animations
	[UIView commitAnimations];
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
	CGRect r = containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	containerView.frame = r;
}
- (IBAction)btnWatchPhoto:(id)sender {
    ModelimageDetail *img_detail = [[ModelimageDetail alloc] init];
    img_detail.modelName =_imgModelname;
    [self.navigationController pushViewController:img_detail
                                         animated:YES];
}
- (IBAction)btnWatchVideo:(id)sender {
    VideoPlayerViewController *video_detail = [[VideoPlayerViewController alloc] init];
    video_detail.videoUrl = _videoUrl;
    [self.navigationController pushViewController:video_detail
                                         animated:YES];
}

//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    return YES;
//}
@end
