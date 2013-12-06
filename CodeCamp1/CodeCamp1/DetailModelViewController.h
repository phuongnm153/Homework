//
//  DetailModelViewController.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"

@interface DetailModelViewController : UIViewController<HPGrowingTextViewDelegate>{
	UIView *containerView;
    HPGrowingTextView *textView;
}



@property (weak, nonatomic) IBOutlet UIImageView *avarta_model;
@property (weak, nonatomic) IBOutlet UIImageView *rating_model;
@property(nonatomic, assign) NSString *model_name;
@property (weak, nonatomic) IBOutlet UIImageView *imgInfoModel;

@end
