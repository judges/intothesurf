//
//  NewsHeaderTableViewCell.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "NewsHeaderTableViewCell.h"


@implementation NewsHeaderTableViewCell

@synthesize Title;
@synthesize Date;
@synthesize Image;
@synthesize BackgroundView;
@synthesize Star;

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
	[Title release];
	[Date release];
	[Image release];
	[BackgroundView release];
	[Star release];

    [super dealloc];
}


@end
