//
//  myPRaddRecordLabelCell.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRaddRecordLabelCell.h"


@implementation myPRaddRecordLabelCell
@synthesize Label;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[Label release];
    [super dealloc];
}


@end
