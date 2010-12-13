//
//  RaceInformationViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceInformationViewController.h"

#include "RaceDay.h"
#include "RaceEvent.h"
#include "RaceInfo.h"
#include "EventKit/EventKit.h"
#import <QuartzCore/QuartzCore.h>
#include "RaceEventViewController.h"
#include "RaceEventDetailsViewController.h"


@implementation RaceInformationViewController

-(id)initWithRaceInfo:(NSArray*)ri
{
	if((self = [super init]))
	{
		greyView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
		greyView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
		
		
		dateFormatter = [[NSDateFormatter alloc]init];
		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
		raceInfoArray = ri;
		[raceInfoArray retain];
		dict=[[NSMutableDictionary alloc]init];
		dictionaryOdViewControllers = [[NSMutableArray alloc]init];
		
		for (int i=0; i < [raceInfoArray count]; i++) 
		{
			NSMutableArray *tmpArray1 = [[NSMutableArray alloc]init];
			RaceInfo* raceInfo = [raceInfoArray objectAtIndex:0];
			for (int j=0;j< [raceInfo.Days count] ; j++) 
			{
				NSMutableArray *tmpArray2= [[NSMutableArray alloc]init];
				RaceDay *raceDay =  [raceInfo.Days objectAtIndex:j];
				for (int k=0; k<[raceDay.Events count]; k++) 
				{
					RaceEvent* raceEvent = [raceDay.Events objectAtIndex:k];
					RaceEventViewController* revc=[[RaceEventViewController alloc] initWithRaceEvent:raceEvent InRaceDay:raceDay Owner:self Selector:@selector(showDetails:)];
					[tmpArray2 addObject:revc];
					[revc release];
				}
				[tmpArray1 addObject:tmpArray2];
				[tmpArray2 release];
			}
			[dictionaryOdViewControllers addObject:tmpArray1];
			[tmpArray1 release];
		}		
	}
	return self;
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
@synthesize barButton;
-(IBAction)save:(id)sender
{
		[self disposeCurrentDetails];
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save All Race events in iCal?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save",nil];
	
	[actionSheet showInView:self.view];
	
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([touches count]>0)
	{
		UITouch *t = [touches anyObject];
		if([t tapCount]>0)
		{
			if(t.view != currentDetails.view)
			{
				[self disposeCurrentDetails];
			}
		}
	}
}


-(void)disposeCurrentDetails
{
	if(currentDetails)
	{
		[greyView removeFromSuperview];
		singleEvent = NO;
		
		[UIView beginAnimations:@"" context:nil];
		[currentDetails.view removeFromSuperview];
		[UIView commitAnimations];
		[currentDetails release];
		currentDetails = nil;
	}
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	if(buttonIndex==0)
	{
		EKEventStore *eventStore = [[EKEventStore alloc]init];
		
		if(singleEvent)
		{
			singleEvent = NO;
			EKEvent* event = [EKEvent eventWithEventStore:eventStore];
			event.title= currentDetails.raceEvent.Title;
			event.startDate = currentDetails.raceEvent.Begining;
			if(currentDetails.raceEvent.Ending)
			{
				event.endDate = currentDetails.raceEvent.Ending;
			}
			else {
				event.endDate = currentDetails.raceEvent.Begining;
			}
			
			event.location = currentDetails.raceEvent.Location;

			[event setCalendar:[eventStore defaultCalendarForNewEvents] ];
			NSError *err;
			
			
			[eventStore saveEvent:event span:EKSpanThisEvent error:&err];
			[self disposeCurrentDetails];

		}
		else
		{
			for(int i=0; i <[raceInfoArray count];i++)
			{
				RaceInfo*rinf = [raceInfoArray objectAtIndex:i];
			
				for(int k=0;k<[rinf.Days count];k++)
				{
					RaceDay*rd = [rinf.Days objectAtIndex:k];
					for(int j=0;j<[rd.Events count];j++)
					{
						RaceEvent  *re = [rd.Events objectAtIndex:j];
						
						EKEvent* event = [EKEvent eventWithEventStore:eventStore];
						
						event.title=re.Title;
						event.startDate = re.Begining;
						if(re.Ending)
						{
							event.endDate = re.Ending;
						}
						else {
							event.endDate = re.Begining;
						}

						event.location = re.Location;
						event.notes = rinf.Title;
						
						[event setCalendar:[eventStore defaultCalendarForNewEvents] ];
						NSError *err;
						
						
						[eventStore saveEvent:event span:EKSpanThisEvent error:&err];
					}
				}
			}
		}
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Race Saved" message:@"Race information succesfully saved." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
		[alert show];
	}
}

-(void)SolveRaceInfo:(RaceInfo*)ri Offset:(int)of Size:(int)s
{
	UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(4, of, 300, s)];
	lbl.text = ri.Title;
	lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:s];
	lbl.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
	[self.view addSubview:lbl];
	[lbl release];
}

-(void)SolveRaceDay:(RaceDay*)rd Offset:(int)of Size:(int)s
{
	UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(4, of, 200, s)];
	[dateFormatter setDateFormat:@"MMM dd"];
	lbl.text = [NSString stringWithFormat:@"%@ - %@",[dateFormatter stringFromDate:rd.Date],rd.Title ];
	lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:s];
	lbl.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
	[self.view addSubview:lbl];
	[lbl release];
}

-(void) SolverRaceEvent:(RaceEvent*)re Offset:(int)of Size:(int)s
{
	UILabel* lbl = [[UILabel alloc] initWithFrame:CGRectMake(8, of, 100, s)];
	if(re.Ending)
	{
		[dateFormatter setDateFormat:@"H:mm"];
		lbl.text =[NSString stringWithFormat:@"%@ - %@", [dateFormatter stringFromDate:re.Begining], [dateFormatter stringFromDate:re.Ending]];
	}
	else
	{
		[dateFormatter setDateFormat:@"H:mm"];
		lbl.text = [dateFormatter stringFromDate:re.Begining];
	}
	lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:s];
	lbl.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
	[self.view addSubview:lbl];
	[lbl release];
	
	
	
	
	lbl = [[UILabel alloc] initWithFrame:CGRectMake(110, of, 320, s)];
	lbl.text = re.Title;
	lbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:s];
	lbl.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
	[self.view addSubview:lbl];
	[lbl release];
	
	
	lbl = [[UILabel alloc] initWithFrame:CGRectMake(110, of+17, 320, s)];
	lbl.text = re.Location;
	lbl.textColor =[UIColor lightGrayColor];
	lbl.font = [UIFont fontWithName:@"Arial" size:s-2];
	lbl.backgroundColor =[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
	[self.view addSubview:lbl];
	[lbl release];
	
	
	
	
	
}

-(void)HandleDetailWindow:(RaceEventDetailsViewController*)redvc
{
	if(redvc.success)
	{
		UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save Race Event in iCal?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save",nil];
		singleEvent =YES;
		[actionSheet showInView:self.view];
		
	}
	else
	{
		[self disposeCurrentDetails];
	}

}



-(void)showDetails:(RaceEventViewController*)revc
{
	
	[self disposeCurrentDetails];
	[self.view addSubview:greyView];
	
	currentDetails =[[RaceEventDetailsViewController alloc] 
										   initWithRaceEvent:revc.raceEvent
										   InRaceDay:revc.raceDay
										   Owner:self 
										   Selector:@selector(HandleDetailWindow:)];
	
	
		
	int width = currentDetails.view.frame.size.width;
	int height = currentDetails.view.frame.size.height;
	
	currentDetails.view.frame = CGRectMake(self.view.center.x -(50/2),self.view.center.y -(50/2)  , 50, 50);
	[self.view addSubview:currentDetails.view];

	[UIView beginAnimations:@"anim" context:nil];
	[UIView setAnimationDuration:.25];
	
	currentDetails.view.frame = CGRectMake(self.view.center.x -(width/2),self.view.center.y -(height/2)  , width, height);

	
	
	
	[UIView commitAnimations];
	
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	self.navigationItem.rightBarButtonItem = self.barButton;
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
	int offset= 10;
	
	for (int i=0; i < [raceInfoArray count]; i++) 
	{
		NSMutableArray *tmpArray1 = [dictionaryOdViewControllers objectAtIndex:i];
		RaceInfo* raceInfo = [raceInfoArray objectAtIndex:0];
		[self SolveRaceInfo:raceInfo Offset:offset Size:28];
		offset +=36;
		for (int j=0;j< [raceInfo.Days count] ; j++) 
		{
			NSMutableArray *tmpArray2 = [tmpArray1 objectAtIndex:j];
			
			RaceDay *raceDay =  [raceInfo.Days objectAtIndex:j];
			
			
			
			[self SolveRaceDay:raceDay Offset:offset Size:20];
			offset+=33;
			UIView *v = [[UIView alloc]initWithFrame:CGRectMake(4, offset-7, 300,8+ 21 * [raceDay.Events count])];
			v.backgroundColor = [UIColor whiteColor];
			
			[v.layer setMasksToBounds:YES];
			[v.layer setCornerRadius:5];
			[v.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
			[v.layer setBorderWidth:1];
			
			
			
			
			[self.view addSubview:v];
			[v release];
			for (int k=0; k<[raceDay.Events count]; k++) 
			{
				RaceEventViewController*revc =[tmpArray2 objectAtIndex:k];
				
				revc.view.frame = CGRectMake(10, offset, 290, 20);
				[self.view addSubview:revc.view];

				offset+=21;
			}
			offset+=8;
		}
	}
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
	[greyView release];
    [super dealloc];
}


@end
