//
//  ModelTableCell.h
//  VictoriaD
//
//  Created by LongDTMacBook on 11/27/13.
//  Copyright (c) 2013 PhuongNM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelTableCell : UITableViewCell

@property (strong, nonatomic) UILabel *nameModel;
@property (strong, nonatomic) UIImageView *iconModel;
- (id) initWithName:(NSString*) name
            andIcon:(NSString*) icon;
@end
