//
//  BasicUserDataViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-30.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtBasicUserDataViewController.h"


@implementation wgtBasicUserDataViewController
@synthesize nameTextField,heighTextField,segmentControl;


-(id)initWithParentViewController:(wgtTrackerRootViewController*)p
{
	self = [super init];
	if(self)
	{
		parent = p;
		localUser = [[wgtUser alloc] init];
	}
	return self;
}



-(id)initWithParentViewController:(wgtTrackerRootViewController*)p AndUser:(wgtUser*)usr
{
	self = [super init];
	if(self)
	{
		parent = p;
		localUser = usr;
		[localUser retain];
	}
	return self;
}
-(wgtUser*)getUser
{
	return localUser;
}

-(IBAction) Done
{
	localUser.Name = nameTextField.text;
	localUser.Height = [nameTextField.text floatValue];
	localUser.IsMale = segmentControl.selectedSegmentIndex==0;
	
	[parent DoneUserEdit:self];
}

-(IBAction) Cancel
{
	[parent CancelUserEdit:self];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[localUser release];
    [super dealloc];
}


@end
