//
//  myPRaddRecordIconCell.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface myPRaddRecordIconCell : UITableViewCell {
	UIImageView *Image;
	UILabel* Label;
}

@property(nonatomic,retain) IBOutlet UIImageView *Image;
@property(nonatomic,retain) IBOutlet UILabel* Label;
@end
