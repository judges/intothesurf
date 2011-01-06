//
//  wgtButtonEntry.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtButtonEntry.h"
#import <QuartzCore/QuartzCore.h>

@implementation wgtButtonEntry
@synthesize TitleLabel,TitleText;

-(id)initWithOwner:(id)own andAction:(SEL)act
{
	self = [super init];
	if(self)
	{
		owner = own;
		action = act;
	}
	return self;
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *t = [touches anyObject];
	if(t.tapCount==1)
	{
		[owner performSelector:action];
	}
}

-(void)SetSelected:(BOOL)s
{
	if(s)
	{
		self.view.backgroundColor = [UIColor colorWithRed:0 green:0xB1/255.0 blue:0xE6/255.0 alpha:1];
	}
	else {
		self.view.backgroundColor = [UIColor whiteColor];
	}

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
	
	
		
	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[self.view.layer setBorderWidth:1];	
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
	[TitleLabel release];
	[TitleText release];
	
    [super dealloc];
}


@end
