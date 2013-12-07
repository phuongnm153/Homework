//
//  DetailModelViewController.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"
#import "RateView.h"
@interface DetailModelViewController : UIViewController <RateViewDelegate,HPGrowingTextViewDelegate>{
	UIView *containerView;
    HPGrowingTextView *textView;
}

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UIImageView *avarta_model;
@property(nonatomic, assign) NSString *model_name;
@property(nonatomic, assign) int *year_select;
@property (weak, nonatomic) IBOutlet UIImageView *imgInfoModel;

@end
