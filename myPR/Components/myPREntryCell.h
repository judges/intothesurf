//
//  myPREntryCell.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myPREntryCell : UIView {
	UILabel* Title;
	UILabel* Value;
}

@property(nonatomic,retain) IBOutlet UILabel* Title;
@property(nonatomic,retain) IBOutlet UILabel* Value;

@end
