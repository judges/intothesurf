//
//  myPRaddEntryViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRaddEntryViewController.h"


@implementation myPRaddEntryViewController
@synthesize Picker,DatePicker, Label, DateButton,ValueButton,CancelButton, DoneButton, isEdit,isSuccess;


-(id)initWithRecord:(myPRRecord*)r Entry:(myPREntry*)e andHandler:(myPRUnitHandler*)h
{		
	self = [super initWithNibName:@"myPRaddEntryViewController" bundle:nil];
	if(self)
	{
		_entry=e;
		[_entry retain];
		_handler=h;
		[_handler retain];
		_record =r;
		[_record retain];
		
		_entry.Date = [self ClearDate:_entry.Date];
		
		_pickerDataArray = [_handler CreatePickerDataSource];
	}
	return self;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[self ValueChanged];
}

-(void)setOwner:(id)owner Selector:(SEL)selector
{
	_owner= owner;
	_selector =selector;
}	

-(myPREntry*)GetEntry
{
	return _entry;
}

-(IBAction)DoneAction
{
	isSuccess=YES;
	[_owner performSelector:_selector];

}
-(IBAction)CancelAction
{
	isSuccess=NO;
	[_owner performSelector:_selector];
}

-(IBAction)ValueChanged
{
	_entry.Date= [self ClearDate:DatePicker.date];
	_entry.Value=[_handler FloatFromPicker:Picker];
	[self RefreshData];
}


-(NSDate*)ClearDate:(NSDate*)d
{
	
	unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
	NSCalendar* calendar = [NSCalendar currentCalendar];
	
	NSDateComponents* components = [calendar components:flags fromDate:d];
	
	NSDate* dateOnly = [calendar dateFromComponents:components];
	
	return dateOnly;
}


-(IBAction)DateAction
{
	if(!isDateUp)
	{
		ValueButton.highlighted=NO;
		[UIView beginAnimations:@"4" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(higlight)];
		DatePicker.frame=CGRectMake(0, DatePicker.frame.origin.y - DatePicker.frame.size.height, 320, DatePicker.frame.size.height);
		Picker.frame=CGRectMake(0, Picker.frame.origin.y + Picker.frame.size.height, 320, Picker.frame.size.height);
		[UIView commitAnimations];
		isDateUp=YES;
	}
}
-(IBAction)ValueAction
{
	if(isDateUp)
	{
		DateButton.highlighted=NO;
		[UIView beginAnimations:@"4" context:nil];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(highlight)];
		Picker.frame=CGRectMake(0, Picker.frame.origin.y - Picker.frame.size.height, 320, Picker.frame.size.height);
		DatePicker.frame=CGRectMake(0, DatePicker.frame.origin.y + DatePicker.frame.size.height, 320, DatePicker.frame.size.height);
		[UIView commitAnimations];
		
		DateButton.highlighted=NO;
		isDateUp=NO;
	}
}

-(void)highlight
{
	if(isDateUp)
	{
		DateButton.highlighted=YES;	
	}
	else
	{
		ValueButton.highlighted=YES;
	}

}

-(void)RefreshData
{
	NSDateFormatter* dateFormatter= [[NSDateFormatter alloc] init];
	
	[dateFormatter setDateFormat:@"MMMM dd yyyy"];
	[DateButton setTitle:[dateFormatter stringFromDate:_entry.Date] forState:UIControlStateNormal];
	[ValueButton setTitle:[_handler StringFromValue:_entry.Value] forState:UIControlStateNormal];
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[_pickerDataArray objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[_pickerDataArray objectAtIndex:component] objectAtIndex:row];
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [_pickerDataArray count];
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
	isDateUp=YES;
	DateButton.highlighted=YES;
	
	
	DatePicker.date= _entry.Date;
	[_handler SetPicker:Picker withValue:_entry.Value];
	
	[self RefreshData];
	
	Label.text =   _record.Label;
	
	self.navigationItem.leftBarButtonItem = CancelButton;
	self.navigationItem.rightBarButtonItem = DoneButton;
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
	[_record release];
	[_handler release];
	[_entry release];
	[_pickerDataArray release];
	self.Picker=nil;
	self.DatePicker=nil;
	self.Label=nil;
	self.DateButton=nil;
	self.ValueButton=nil;
	self.CancelButton=nil;
	self.DoneButton=nil;
    [super dealloc];
}


@end
