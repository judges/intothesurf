//
//  BasicUserDataViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-30.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wgtUser.h"
#import "wgtTrackerRootViewController.h"

@interface wgtBasicUserDataViewController : UIViewController {

	wgtUser* localUser;
	wgtTrackerRootViewController* parent;
	
	UITextField* nameTextField;
	UITextField* heighTextField;
	UISegmentedControl* segmentControl;
	
}
@property(nonatomic,retain) IBOutlet UITextField* nameTextField;
@property(nonatomic,retain) IBOutlet UITextField* heighTextField;
@property(nonatomic,retain) IBOutlet UISegmentedControl* segmentControl;

-(id)initWithParentViewController:(wgtTrackerRootViewController*)p;
-(id)initWithParentViewController:(wgtTrackerRootViewController*)p AndUser:(wgtUser*)usr;

-(wgtUser*)getUser;


-(IBAction) Done;
-(IBAction) Cancel;


@end
