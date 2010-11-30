//
//  RootViewController.m
//  Lavaman
//
//  Created by Jakub Dlugosz
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RootViewController.h"
#include "RegistrationResultsPhotos.h"
#include "TravelActivitiesViewController.h"
#include "MessageList.h"
#include "MessageContainer.h"

#include "TravelActivitiesCreator.h"
#include "RaceInformationCreator.h"
#include "RaceInformationViewController.h"
#include "ItemsToDoViewController.h"
#include "TrainingToolsViewController.h"
#include "SponsorsCreator.h"
@implementation RootViewController


@synthesize MessagesButton;
@synthesize MessagesLabel;
@synthesize Acivity;
@synthesize messageContainer;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
	 }
 return self;
 }

*/
-(void)displayError
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection problem." message:@"There has been an error connecting with the Lavaman Message server. Check your Internet connection, or try again later." delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];

	[alert show];
	[alert release];
}

-(void)registrationTouchUpInside:(id)sender
{
	//[self.navigationController pushViewController:_registrationresultsPhotos animated:YES];
	RegistrationResultsPhotos* r = 	[[RegistrationResultsPhotos alloc]init];

	[self.navigationController pushViewController:r animated:YES];
	[r release];
}

-(void)travelActivitiesUpInside:(id)sender
{
	
	NSArray*arr = [TravelActivitiesCreator CreateTravelActivities];
	TravelActivitiesViewController *tsad = [[TravelActivitiesViewController alloc]initWithCategoryArray:arr NavController:self.navigationController];
	[arr release];
	
	[self.navigationController pushViewController:tsad animated:YES];
	[tsad release];
	
}


-(void)messagesTouchBeganInside:(id)sender
{
	MessagesButton.hidden = YES;
	Acivity.hidden = NO;
	MessagesLabel.hidden =YES;
}

-(void)messagesTouchUpInside:(id)sender
{
	if(![messageContainer DownloadNewMessages])
	{
		if(!errorDisplayed)
		{
			errorDisplayed= YES;
			[self displayError];
		}
	}else
	{
		errorDisplayed = NO;
	}

	
	MessageList * mlist = [[MessageList alloc]initWithMessageContainer:messageContainer];
	
	
	Acivity.hidden = YES;
	MessagesButton.hidden = NO;
	MessagesLabel.hidden = NO;

	[self.navigationController pushViewController:mlist animated:YES];
	[mlist release];
}


-(void)raceInfoTouchUpInside:(id)sender
{
	NSArray * arr = [RaceInformationCreator CreateRaceInfo];
	
	RaceInformationViewController* rivc = [[RaceInformationViewController alloc]initWithRaceInfo:arr];
	rivc.title =@"Race information";
	[self.navigationController pushViewController:rivc animated:YES];
	[rivc release];
}

-(void)sponsorsTouchUpInside:(id)sender
{
	NSArray *arr=[SponsorsCreator CreateSponsors];
	ItemsToDoViewController *itd = [[ItemsToDoViewController alloc]initWithItemArray:arr NavController:self.navigationController];
	[arr release];
	
	itd.title=  @"Sponsors";
	[self.navigationController pushViewController:itd animated:YES];
	
	[itd release];
}

-(void)trainingToolsTouchUp:(id)sender
{
	TrainingToolsViewController *tt = [[TrainingToolsViewController alloc]init];	
	[self.navigationController pushViewController:tt animated:YES];
	[tt release];
}

-(void)updateMessageCount
{
	int count = [messageContainer GetUnreadMessageNumber];
	
	if(count==0)
	{
		MessagesLabel.text = @"";
		MessagesButton.imageView.image = [UIImage imageNamed:@"mail.png"];
	}
	else
	{
		MessagesLabel.text = [NSString stringWithFormat:@"%d",count];
		MessagesButton.imageView.image = [UIImage imageNamed:@"mail_new.png"];
	}
}

-(void)finishedQueringUnread:(BOOL)success
{
	if(success)
	{
		[self updateMessageCount];
	}
	else 
	{
		if(!errorDisplayed)
		{
			errorDisplayed= YES;
			[self displayError];
		}
	}

}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	if(!messageContainer)
	{
		messageContainer = [[MessageContainer alloc]initWithOwner:self Selector:@selector(finishedQueringUnread:)];
	}
	
	[super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lavamanbackground.jpg"]]];
	
}


-(void)viewWillAppear:(BOOL)animated
{
	[self updateMessageCount];
	[messageContainer QueryUnreadCount];
	
	[self.navigationController setNavigationBarHidden:YES animated:YES];
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
	[messageContainer release];
	[MessagesButton release];
	[MessagesLabel release];
	[Acivity release];
    [super dealloc];
}



@end
