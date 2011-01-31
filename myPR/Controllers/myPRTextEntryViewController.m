//
//  wgtTextEntryViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-09.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRTextEntryViewController.h"


@implementation myPRTextEntryViewController
@synthesize textView,btn;


-(IBAction)doneAction
{
	[[NSUserDefaults standardUserDefaults] setValue:textView.text forKey:@"myPRTextEntry"];
	[self.view removeFromSuperview];
	
}

-(void)SetSettings:(myPRSettings*)s
{
	_settings =s;
	[_settings retain];
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
	self.navigationItem.title = @"Message";
	
	self.view.backgroundColor = _settings.BackgroundColor;
	[textView becomeFirstResponder];
	
	NSString*string = [[NSUserDefaults standardUserDefaults] stringForKey:@"myPRTextEntry"];

	textView.text =string;
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
	[_settings release];
	[[NSUserDefaults standardUserDefaults]setValue:textView.text forKey:@"myPRTextEntry"];
	[btn release];
	[textView release];
    [super dealloc];
}


@end
