//
//  BasicUserDataViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-30.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtBasicUserDataViewController.h"
#import "wgtSettings.h"

@implementation wgtBasicUserDataViewController
@synthesize nameTextField,heightButton,segmentControl,pickerView,unitSegment,toolBar,cancelButton,doneButton, toolbar;

-(void)initPicker
{
	pickerIsUp = NO;
	imperialData = [[NSMutableArray alloc] init];
	metricData = [[NSMutableArray alloc] init];
	
	NSMutableArray* feet= [[NSMutableArray alloc] init];
	for(int i=0;i<10;i++)
	{
		[feet addObject:[NSString stringWithFormat:@"%d ft",i]];
	}
	
	[imperialData addObject:feet];
	[feet release];
	
	NSMutableArray* inch= [[NSMutableArray alloc] init];
	for(int i=0;i<12;i++)
	{
		[inch addObject:[NSString stringWithFormat:@"%d inch",i]];
	}
	[imperialData addObject:inch];
	[inch release];
	
	NSMutableArray* meters= [[NSMutableArray alloc] init];
	for(int i=0;i<3;i++)
	{
		[meters addObject:[NSString stringWithFormat:@"%d m",i]];
	}
	
	[metricData addObject:meters];
	[meters release];
	
	NSMutableArray* cm= [[NSMutableArray alloc] init];
	for(int i=0;i<100;i++)
	{
		[cm addObject:[NSString stringWithFormat:@"%d cm",i]];
	}
	[metricData addObject:cm];
	[cm release];
	
	currentSource = imperialData;
}

-(void)setSettings:(wgtSettings *)s
{
	_settings = s;
	[_settings retain];
}
-(id)initWithParentViewController:(wgtTrackerRootViewController*)p
{
	self = [super init];
	if(self)
	{
		parent = p;
		localUser = [[wgtUser alloc] init];
		localUser.UseImperial=YES;
		[self initPicker];
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
		[self initPicker];
	
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
	localUser.IsMale = segmentControl.selectedSegmentIndex==0;
	[parent DoneUserEdit:self];
}

-(IBAction) Cancel
{
	[parent CancelUserEdit:self];
}

-(IBAction) HeightEdit
{
	[nameTextField resignFirstResponder];
	if(!pickerIsUp)
	{
		[UIView beginAnimations:@"" context:nil];
		[UIView setAnimationDuration:0.3];
		pickerView.frame = CGRectMake(0, pickerView.frame.origin.y-256, 320,  pickerView.frame.size.height);
		[UIView commitAnimations];
		pickerIsUp = YES;
	}
}

-(IBAction) NameEdit
{
	if(pickerIsUp)
	{
		[UIView beginAnimations:@"" context:nil];
		[UIView setAnimationDuration:0.3];
		pickerView.frame = CGRectMake(0, pickerView.frame.origin.y+256, 320,  pickerView.frame.size.height);
		[UIView commitAnimations];
		pickerIsUp = NO;
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
-(IBAction) MetricChanged
{
	if(unitSegment.selectedSegmentIndex==0)
	{
		currentSource = imperialData;
		localUser.UseImperial=YES;
	}
	else
	{
		currentSource = metricData;
		localUser.UseImperial=NO;
	}
	[pickerView reloadAllComponents];
	[self SetPicker];
}

-(void)UpdateView
{
//	nameTextField.text = localUser.Name;
	if(localUser.IsMale)
	{
		segmentControl.selectedSegmentIndex =0;
	}
	else
	{
		segmentControl.selectedSegmentIndex =1;

	}
	
	if(localUser.UseImperial)
	{
		unitSegment.selectedSegmentIndex = 0;
	}
	else
	{
		unitSegment.selectedSegmentIndex=1;
	}
	
	[heightButton setTitle:[localUser FormatHeight] forState:UIControlStateNormal];
	
	
	
}
-(void)SetPicker
{
	if(localUser.UseImperial)
	{
		float inches = round(localUser.Height / 2.54);
		float feet = inches/12;
		inches = ((int)round(inches))%12;
		
		[pickerView selectRow:inches inComponent:0 animated:YES];
		[pickerView selectRow:feet inComponent:1 animated:YES];
	}
	else
	{
		int meters = localUser.Height/100;
		int cm = ((int)localUser.Height) %100;
		
		[pickerView selectRow:meters inComponent:0 animated:YES];
		[pickerView selectRow:cm inComponent:1 animated:YES];
	}
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [currentSource count];
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[currentSource objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[currentSource objectAtIndex:component] objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerV didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if(localUser.UseImperial)
	{
		localUser.Height = round(([pickerV selectedRowInComponent:0]*12 + [pickerV selectedRowInComponent:1])*2.54);
	}
	else
	{
		localUser.Height = [pickerV selectedRowInComponent:0]*100 + [pickerV selectedRowInComponent:1];
	}

	[self UpdateView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//self.toolBar.tintColor =[UIColor orangeColor];
	
	
	
	//segmentControl.tintColor =[UIColor orangeColor];
	//unitSegment.tintColor =[UIColor orangeColor];
	self.view.backgroundColor = _settings.BackgroundColor; // [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    toolBar.tintColor = _settings.TintColor;
	
	
	[super viewDidLoad];
	
	[self UpdateView];
	
	nameTextField.text = localUser.Name;
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
	
	[nameTextField release];
	[heightButton release];
	[segmentControl release];
	[unitSegment release];
	[pickerView release];
	
	[cancelButton release];
	[doneButton release];
	
	[toolbar release];
	[_settings release];
	[imperialData release];
	[metricData release];
	[localUser release];
    [super dealloc];
}


@end
