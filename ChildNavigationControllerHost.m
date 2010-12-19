//
//  ChildNavigationControllerHost.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "ChildNavigationControllerHost.h"
#import "triCalcRootController.h"
#import "triCalcSettings.h"

@implementation ChildNavigationControllerHost


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		
		
		triCalcSettings *settings = [[triCalcSettings alloc]init];
		settings.TintColor=[UIColor orangeColor];
		settings.BackgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
		
		triCalcRootController * rootController = [[triCalcRootController alloc]initWithSettings:settings];
		[settings release];
		
		childNavigationController = [[UINavigationController alloc]initWithRootViewController:rootController];
	
		[self.navigationItem setTitle:@"TriCalc"];
		
		childNavigationController.view.frame = CGRectMake(0, 0, 320, 460);
		[rootController release];
	
		
    }
    return self;
}



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
