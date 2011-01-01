    //
//  wgtTrackerContainer.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-24.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtTrackerContainer.h"
#import "wgtTracker.h"


@implementation wgtTrackerContainer




 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		
		wgtTrackerRootViewController * rootController = [[wgtTrackerRootViewController alloc]initWithNibName:@"wgtTrackerRootViewController" bundle:[NSBundle mainBundle]];
		
		
		childNavigationController = [[UINavigationController alloc]initWithRootViewController:rootController];
		
		[self.navigationItem setTitle:@"Weight tracker"];
		
		childNavigationController.view.frame = CGRectMake(0, 0, 320, 460);
		[rootController release];
		
		
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:childNavigationController.view];
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
		[childNavigationController release];
    [super dealloc];
}


@end
