//
//  wgtTrackerWeightEntryViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtTrackerWeightEntryViewController.h"
#include "wgtTrackerUserWeightViewController.h"

@implementation wgtTrackerWeightEntryViewController
@synthesize weightPicker,datePicker, weightButton, dateButton,fatButton,waterButton,fatPicker,waterPicker;

-(id)initWithOwner:(wgtTrackerUserWeightViewController*) own Entry:(wgtWeightEntry*)entry User:(wgtUser*)usr
{
	self =[super init];
	if(self)
	{
		owner = own;
		currentEntry =entry;
		[currentEntry retain];
		currentUser = usr;
		[currentUser retain];
		datePickerVisible=NO;
		weightPickerVisible= NO;
	}
	return self;
	
}

-(wgtWeightEntry*)getCurrentEntry
{
	return currentEntry;
}

-(IBAction)EditFat
{
	[self clearHighlihting];
	[UIView beginAnimations:@"1" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDidStopSelector:@selector(highlihting)];
	[UIView setAnimationDelegate:self];
	if(currentPicker != fatPicker)
	{
		currentPicker.frame = CGRectMake(0, currentPicker.frame.origin.y+214, 320, currentPicker.frame.size.height);
		fatPicker.frame = CGRectMake(0, fatPicker.frame.origin.y-214, 320, fatPicker.frame.size.height);
		
	}
	[UIView commitAnimations];
	currentPicker =fatPicker;
	[self updateView];
}
-(IBAction)EditWater
{
	[self clearHighlihting];
	[UIView beginAnimations:@"2" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDidStopSelector:@selector(highlihting)];
	[UIView setAnimationDelegate:self];
	if(currentPicker != waterPicker)
	{
		currentPicker.frame = CGRectMake(0, currentPicker.frame.origin.y+214, 320, currentPicker.frame.size.height);
		waterPicker.frame = CGRectMake(0, waterPicker.frame.origin.y-214, 320, waterPicker.frame.size.height);
		
	}
	[UIView commitAnimations];
	currentPicker =waterPicker;
	[self updateView];
}

-(IBAction)EditWeight
{
	[self clearHighlihting];
	[UIView beginAnimations:@"3" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDidStopSelector:@selector(highlihting)];
	[UIView setAnimationDelegate:self];
	if(currentPicker != weightPicker)
	{
		currentPicker.frame = CGRectMake(0, currentPicker.frame.origin.y+214, 320, currentPicker.frame.size.height);
		weightPicker.frame = CGRectMake(0, weightPicker.frame.origin.y-214, 320, weightPicker.frame.size.height);
	
	}
	[UIView commitAnimations];
	currentPicker =weightPicker;
		[self updateView];
	
}
-(IBAction)EditDate
{
	[self clearHighlihting];
	[UIView beginAnimations:@"4" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDidStopSelector:@selector(highlihting)];
	[UIView setAnimationDelegate:self];
	
	if(currentPicker != datePicker)
	{
		currentPicker.frame = CGRectMake(0, currentPicker.frame.origin.y+214, 320, currentPicker.frame.size.height);
		datePicker.frame = CGRectMake(0, datePicker.frame.origin.y-214, 320, datePicker.frame.size.height);
	}
	[UIView commitAnimations];
	currentPicker = datePicker;
	
	[self updateView];
}

-(void)setPickers
{
	
}
-(IBAction)pickersChanged
{
	currentEntry.Weight = [pickerController GetWeight];
	currentEntry.Date = [self ClearDate:datePicker.date];
	currentEntry.Fat = [fatPickerController GetPercent];
	currentEntry.Water =[waterPickerController GetPercent];
	[self updateView];
}
-(void)updateView
{
	NSDateFormatter* formatter =[[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"MMM dd YYYY"];

	[dateButton setTitle:[formatter stringFromDate:currentEntry.Date] forState:UIControlStateNormal];
	[weightButton setTitle:[wgtUser FormatWeight:currentEntry.Weight UseImp:currentUser.UseImperial] forState:UIControlStateNormal];
	[fatButton	setTitle:[NSString stringWithFormat:@"%1.2f%@", currentEntry.Fat,@"%" ] forState:UIControlStateNormal];
	[waterButton setTitle:[NSString stringWithFormat:@"%1.2f%@", currentEntry.Water,@"%" ] forState:UIControlStateNormal];
	
	[formatter release];
		
	
	
}

-(void)clearHighlihting
{
	fatButton.highlighted=NO;
	waterButton.highlighted=NO;
	dateButton.highlighted=NO;
    weightButton.highlighted = NO;
}

-(IBAction)highlihting
{
	
	
	if(currentPicker==fatPicker)
	{
		fatButton.highlighted=YES;
	}
	else if(currentPicker ==weightPicker)
	{
		weightButton.highlighted=YES;
		
	}else if(currentPicker ==waterPicker)
	{
		waterButton.highlighted=YES;
	}else
	{
		dateButton.highlighted=YES;
	}
	
	
}
-(IBAction)Cancel
{
	[owner EditCancel];
}
-(IBAction)Done
{
	[owner EditDone];
}

-(NSDate*)ClearDate:(NSDate*)d
{
	
	unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
	NSCalendar* calendar = [NSCalendar currentCalendar];
	
	NSDateComponents* components = [calendar components:flags fromDate:d];
	
	NSDate* dateOnly = [calendar dateFromComponents:components];
	
	return dateOnly;
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
	
	self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
	pickerController = [[wgtWeightPicker alloc] initWithPicker:weightPicker Owner:self Selector:@selector(pickersChanged)];
	[weightPicker setDataSource:pickerController];
	[weightPicker setDelegate:pickerController];
	
	fatPickerController =[[wgtPercentPicker alloc] initWithPicker:fatPicker Owner:self Selector:@selector(pickersChanged) MinPercent:0 MaxPercent:50];
	waterPickerController =[[wgtPercentPicker alloc]initWithPicker:waterPicker Owner:self Selector:@selector(pickersChanged) MinPercent:30 MaxPercent:80];
	if(currentEntry.Water<30)
	{
		currentEntry.Water= 30;
	}
	
	[fatPickerController SetPercent:currentEntry.Fat];
	[waterPickerController SetPercent:currentEntry.Water];
	
	
	
	[pickerController SetUseImperial:currentUser.UseImperial];
	[pickerController SetWeight:currentEntry.Weight];
	if(currentEntry.Date)
	{
		[datePicker setDate:currentEntry.Date];
	}
	else
	{
		currentEntry.Date = [self ClearDate:[NSDate date]];
		[datePicker setDate:currentEntry.Date];
	}

	
	currentPicker = datePicker;
	dateButton.highlighted=YES;
	[self updateView];
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
	[currentEntry release];
	[currentUser release];
	[dateButton release];
	[weightButton release];
	[weightPicker release];
	[datePicker release];
    [super dealloc];
}


@end
