//
//  wgtTrackerUserCell.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "wgtUser.h"

@interface wgtTrackerUserCell : UITableViewCell {
	UILabel* Name;
	UIImageView* Gender;
	UILabel* Height;
	

}

@property(nonatomic,retain) IBOutlet UILabel* Name;
@property(nonatomic,retain) IBOutlet UIImageView* Gender;
@property(nonatomic,retain) IBOutlet UILabel* Height;

@end
