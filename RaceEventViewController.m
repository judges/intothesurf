//
//  RaceEventViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-20.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceEventViewController.h"
#include "RaceEvent.h"
#include "RaceDay.h"

@implementation RaceEventViewController

@synthesize TimeLabel;
@synthesize TextLabel;
@synthesize ShowDeailsButton;

@synthesize raceDay;
@synthesize raceEvent;

-(id)initWithRaceEvent:(RaceEvent*)re InRaceDay:(RaceDay*)rd Owner:(id)own Selector:(SEL)sel
{
	self= [super init];
	if(self)
	{
		dateFormatter = [[NSDateFormatter alloc]init];
		self.raceEvent = re;
		
		self.raceDay =rd;
		
		
		owner = own;
		selector = sel;
	}
	return self;
}

-(IBAction) raceDetailTouchUpInside:(id)sender
{

	[owner performSelector:selector withObject:self]  ;
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
	
	[dateFormatter setDateFormat:@"hh:mm a"];
	[dateFormatter setAMSymbol:@"am"];
	[dateFormatter setPMSymbol:@"pm"];
	
	//if(raceEvent.Ending)
	//{

		//TimeLabel.text =[NSString stringWithFormat:@"%@ - %@", [dateFormatter stringFromDate:raceEvent.Begining], [dateFormatter stringFromDate:raceEvent.Ending]];
	//}
	//else
	//{

		TimeLabel.text = [dateFormatter stringFromDate:raceEvent.Begining];
	//}
		TextLabel.text = raceEvent.Title;
	/*
	
	TimeLabel.text =[NSString stringWithFormat:@"%@ - %@", [dateFormatter stringFromDate:raceEvent.Begining], [dateFormatter stringFromDate:raceEvent.Ending]];
	

	 
	 */

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
	[raceEvent release];
	[dateFormatter release];
	[TimeLabel release];
	[TextLabel release];
	[ShowDeailsButton release];
	[raceDay release];
    [super dealloc];
}


@end
