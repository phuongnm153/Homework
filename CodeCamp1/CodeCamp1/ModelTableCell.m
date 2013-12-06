//
//  ModelTableCell.m
//  VictoriaD
//
//  Created by LongDTMacBook on 11/27/13.
//  Copyright (c) 2013 PhuongNM. All rights reserved.
//

#import "ModelTableCell.h"

@implementation ModelTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Helpers
        //CGSize size = self.contentView.frame.size;
        
        // Initialize Main Label
        self.nameModel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 5.0, 200, 3)];
        
        // Configure Main Label
        [self.nameModel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [self.nameModel setTextAlignment:NSTextAlignmentLeft];
        //[self.mainLabel setTextColor:[UIColor redColor]];
        [self.nameModel setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
        
        //Image
        self.iconModel = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 5.0, 60.0, 60.0)];
        self.iconModel.contentMode = UIViewContentModeScaleAspectFit;
        // self.myImageView.center = self.contentView.center;
        
        // Add Main Label to Content View
        [self.contentView addSubview:self.nameModel];
        [self.contentView addSubview:self.iconModel];
    }
    
    return self;
}
- (id) initWithName:(NSString*) name
            andIcon:(NSString*) icon
{
    if (self = [super init]) {
        self.nameModel.text = name;
        self.iconModel.image = [UIImage imageNamed:icon];
    }
    return self;
}
@end
