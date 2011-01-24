//
//  myPREntryCell.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPREntryCell.h"


@implementation myPREntryCell
@synthesize Title,Value;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	self.Title=nil;
	self.Value=nil;
    [super dealloc];
}


@end
