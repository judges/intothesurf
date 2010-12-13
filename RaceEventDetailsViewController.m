//
//  RaceEventDetailsViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-20.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceEventDetailsViewController.h"
#include "RaceEvent.h"
#include "RaceDay.h"
#import <QuartzCore/QuartzCore.h>

@implementation RaceEventDetailsViewController

@synthesize AddToCallendarButton;
@synthesize Location;
@synthesize Time;
@synthesize Title;

@synthesize success;
@synthesize raceDay;
@synthesize raceEvent;


-(id)initWithRaceEvent:(RaceEvent*)re InRaceDay:(RaceDay*)rd  Owner:(id)own Selector:(SEL)sel
{
	self = [super init];
	if(self)
	{
		dateFormatter = [[NSDateFormatter alloc]init];

		owner = own;
		selector = sel;
		self.raceDay = rd;
		self.raceEvent = re;
	}
	return self;
}

-(IBAction) AddToCallendar:(id)sender
{
	success=YES;
	[owner performSelector:selector withObject:self];
}
-(IBAction) CloseWindow:(id)sender
{
	success=NO;
	[owner performSelector:selector withObject:self];
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

		//Time.text =[NSString stringWithFormat:@"%@ - %@", [dateFormatter stringFromDate:raceEvent.Begining], [dateFormatter stringFromDate:raceEvent.Ending]];
	//}
	//else
	//{
	if(!raceEvent.Ending)
	{
		Time.text = [dateFormatter stringFromDate:raceEvent.Begining];
	}
	else
	{

		Time.text =[NSString stringWithFormat:@"%@ - %@",[dateFormatter stringFromDate:raceEvent.Begining],[dateFormatter stringFromDate:raceEvent.Ending]];
	}
	//}
	
	Location.text = raceEvent.Location;
	
	
	Title.text = raceEvent.Title;


	
	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[self.view.layer setBorderWidth:2];	
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
	
	[ AddToCallendarButton release];
	[ Location release];
	[ Time release];
	[ Title release];
	

	[ raceDay release];
	[ raceEvent release];
	
	
    [super dealloc];
}


@end
