//
//  wgtTrackerEntryCell.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface wgtTrackerEntryCell : UITableViewCell {
	UILabel *Date;
	UILabel *Weight;
	UILabel *Bmi;
	UILabel *Fat;
	UILabel *Water;
}

@property(nonatomic,retain) IBOutlet UILabel *Date;
@property(nonatomic,retain) IBOutlet UILabel *Weight;
@property(nonatomic,retain) IBOutlet UILabel *Bmi;
@property(nonatomic,retain) IBOutlet UILabel *Fat;
@property(nonatomic,retain) IBOutlet UILabel *Water;

@end
