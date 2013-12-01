//
//  DetailTableModelViewController.h
//  CodeCamp1
//
//  Created by MAC on 11/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableModelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, assign) int *year_select;
@end
