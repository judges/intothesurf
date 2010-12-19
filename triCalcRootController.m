//
//  triCalcRootController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcRootController.h"
#import "triCalcSettings.h"
#import "triCalcDataSelect.h"
#import "triCalcPickerController.h"
#import "triCalcTriathlonTime.h"

@implementation triCalcRootController
@synthesize toolBar;
@synthesize topLeftSegmentControl;
@synthesize topRightSegmentControl;
@synthesize bottomSegmentControl;
@synthesize picker;


-(id) initWithSettings:(triCalcSettings*)s
{
	self = [super init];
	
	if(self)
	{
	
	settings = s;
	[s retain];
		Time =[[triCalcDataSelect alloc] initWithTitle:@"Time" Value:@"0:00:00" Metrics:@"" ButtonVisible:NO];
		[Time setOwner:self delegate:@selector(edit:)];
		Distance=[[triCalcDataSelect alloc] initWithTitle:@"Distance" Value:@"0" Metrics:@"meters" ButtonVisible:YES];
		[Distance setOwner:self delegate:@selector(edit:)];
		Paste=[[triCalcDataSelect alloc] initWithTitle:@"Pace" Value:@"0:00:00" Metrics:@"kpm" ButtonVisible:NO];
		[Paste setOwner:self delegate:@selector(edit:)];
		RaceTime=[[triCalcDataSelect alloc] initWithTitle:@"Race time" Value:@"0:00:00" Metrics:@"" ButtonVisible:NO];
		[RaceTime setOwner:self delegate:@selector(edit:)];
		[RaceTime setActive:NO];
		
		T1 = [[triCalcDataSelect alloc] initWithTitle:@"T1 time" Value:@"0:00" Metrics:@"" ButtonVisible:NO];
		[T1 setOwner:self delegate:@selector(edit:)];
		T2 = [[triCalcDataSelect alloc] initWithTitle:@"T2 time" Value:@"0:00" Metrics:@"" ButtonVisible:NO];
		[T2 setOwner:self delegate:@selector(edit:)];
		
		
		first = 3;
		second = 40;
		third = 88;

		pickerController = [[triCalcPickerController alloc] init];
		
		triathlonTime = [[triCalcTriathlonTime alloc] init];
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickerChanged:) name:@"pickerChanged" object:nil];
		
	}
	
	return self;
}



-(void)toTransition
{
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	self.navigationItem.rightBarButtonItem=nil;
	self.navigationItem.leftBarButtonItem=nil;
//	topRightSegmentControl.hidden =YES;
//	topLeftSegmentControl.hidden=YES;
	self.navigationItem.title = @"Transitions";
	
	T1.view.alpha =1;
	T2.view.alpha= 1;
	
	Paste.view.alpha = 0;
	Time.view.alpha=0;
	Distance.view.alpha=0;
	[UIView commitAnimations];
	
	
	}
-(void)fromTransition
{
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	
	UIBarButtonItem *bbiR = [[UIBarButtonItem alloc] initWithCustomView:topRightSegmentControl];
	UIBarButtonItem *bbiL = [[UIBarButtonItem alloc] initWithCustomView:topLeftSegmentControl];
	self.navigationItem.title = nil;
	self.navigationItem.rightBarButtonItem=bbiR;
	self.navigationItem.leftBarButtonItem=bbiL;
	
	[bbiR release];
	[bbiL release];
	
	//self.navigationItem.title = @"";
	T1.view.alpha =0;
	T2.view.alpha= 0;
	
	Paste.view.alpha = 1;
	Time.view.alpha=1;
	Distance.view.alpha=1;
	[UIView commitAnimations];
}

-(IBAction) metricChanged:(id)sender
{
	switch (topLeftSegmentControl.selectedSegmentIndex) {
		case 0:
			[triathlonTime updateUseMile:NO];
			break;
		case 1:
			[triathlonTime updateUseMile:YES];
			break;
	}
	[self updateScreen];
}


-(IBAction) screenChanged:(id)sender
{
	if(bottomSegmentControl.selectedSegmentIndex == 3)
	{
		[self toTransition];
		currentEdit =-1;
		[pickerController SetNone];
		currentScreen = bottomSegmentControl.selectedSegmentIndex;
		
	}
	else if(currentScreen ==3)
	{
		[self fromTransition];
		currentEdit =-1;
		[pickerController SetNone];
		currentScreen = bottomSegmentControl.selectedSegmentIndex;
		
	}else
	{
		currentScreen = bottomSegmentControl.selectedSegmentIndex;
		switch (currentEdit) {
			case 0:
				[self edit:Time];
				break;
			case 1:
				[self edit:Distance];
				break;
			case 2:
				[self edit:Paste];
				break;
		}
		
	}
	
	[self updateScreen];
		
}

-(void)pickerChanged:(id)sender;
{
	float value;
	if(currentScreen == 3)
	{
		value = [pickerController GetValue:3];
	}
	else {
		value = [pickerController GetValue:currentEdit];
	}

	[triathlonTime updateValue:value InEdit:currentEdit InScreen:currentScreen InMode:currentMode];
	[self updateScreen];
}


-(void)edit:(id)sender;
{
	if(sender == Time)
	{
		if(currentMode!=0)
		{
			float val = [triathlonTime GetValueInEdit:0 InScreen:currentScreen];
			[pickerController SetTime:triathlonTime.useMile Current:val];
			currentEdit = 0;
		}
		
	}else if(sender == Distance)
	{
		if(currentMode!=1)
		{
			float val = [triathlonTime GetValueInEdit:1 InScreen:currentScreen];
			[pickerController SetDistance:triathlonTime.useMile Current:val];
			currentEdit = 1;
		}
		
	}else if(sender == Paste)
	{
		if(currentMode !=2)
		{
			float val = [triathlonTime GetValueInEdit:2 InScreen:currentScreen];
			[pickerController SetPace:triathlonTime.useMile Current:val];
			currentEdit= 2;
		}
	}else if(sender == T1)
	{
		if(currentEdit!=0)
		{
			float val = [triathlonTime GetValueInEdit:0 InScreen:currentScreen];
			[pickerController SetTime:triathlonTime.useMile Current:val];
			currentEdit= 0;
		}
	}else if(sender == T2)
	{
		if(currentEdit!=1)
		{
			float val = [triathlonTime GetValueInEdit:1 InScreen:currentScreen];
			[pickerController SetTime:triathlonTime.useMile Current:val];
			currentEdit= 1;
		}
	}

	[self updateScreen];
}

-(IBAction) typeChanged:(id)sender
{
	currentEdit = -1;
	[pickerController SetNone];
	currentMode = topRightSegmentControl.selectedSegmentIndex;
	switch (topRightSegmentControl.selectedSegmentIndex) 
	{
			
		case 0:
			[self animateTime];
			
			break;
		case 1:
			[self animateDistance];
			break;
		case 2:
			[self animatePace];
			break;
	}
	
	[self updateScreen];
}

-(NSString*)FormatTransition:(float)v
{
	int time = floor(v);
	int h= time/3600;
	int m = (time % 3600)/60;
	int s = time % 60;
	
	return [NSString stringWithFormat:@"%d:%02d",m,s];
	
}

-(NSString*)FormatTime:(float)v
{
	int time = floor(v);
	int h= time/3600;
	int m = (time % 3600)/60;
	int s = time % 60;

	return [NSString stringWithFormat:@"%d:%02d:%02d",h,m,s];
	
}

-(NSString*)FormatPace:(float)v
{
	int decimal = floor(v);
	int frac = floor(v*100);
	frac = frac % 100;
	
	return [NSString stringWithFormat:@"%d.%02d",decimal,frac];
}

-(NSString*)FormatDistance:(float)v
{
	int decimal = (v*1000);
	return [NSString stringWithFormat:@"%d",decimal];
}

-(void)updateScreen
{
	if(currentScreen !=3)
	{
		Time.TextField.text = [self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:currentScreen]];

		Distance.TextField.text =[self FormatDistance: [triathlonTime GetValueInEdit:1 InScreen:currentScreen]];
		Paste.TextField.text = [self FormatPace: [triathlonTime GetValueInEdit:2 InScreen:currentScreen]];
	}
	else
	{
		T1.TextField.text = [self FormatTransition:[triathlonTime GetValueInEdit:0 InScreen:currentScreen]];
		T2.TextField.text= [self FormatTransition:[triathlonTime GetValueInEdit:1 InScreen:currentScreen]];
	}

	
	
	RaceTime.TextField.text =	[self FormatTime: [triathlonTime GetValueInEdit:0 InScreen:0]
								+[triathlonTime GetValueInEdit:0 InScreen:1]
								+[triathlonTime GetValueInEdit:0 InScreen:2]
								+[triathlonTime GetValueInEdit:0 InScreen:3]
								+[triathlonTime GetValueInEdit:1 InScreen:3]];
	
	T1.view.backgroundColor = [UIColor whiteColor];
	T2.view.backgroundColor = [UIColor whiteColor];
	
	if(currentEdit == -1)
	{
		Time.view.backgroundColor = [UIColor whiteColor];
		Distance.view.backgroundColor = [UIColor whiteColor];
		Paste.view.backgroundColor = [UIColor whiteColor];
		if(currentMode == 0)
		{
				Time.view.backgroundColor = [UIColor lightGrayColor];
		}
		if(currentMode==1)
		{
			Distance.view.backgroundColor = [UIColor lightGrayColor];
		}
		if(currentMode==2)
		{
			Paste.view.backgroundColor = [UIColor lightGrayColor];
		}
	}
	
	if(currentEdit == 0)
	{
		Time.view.backgroundColor = [UIColor blueColor];
		if(currentMode == 1) //distance mode
		{
			Distance.view.backgroundColor = [UIColor lightGrayColor];
			Paste.view.backgroundColor = [UIColor whiteColor];
		}
		else 
		{
			Paste.view.backgroundColor = [UIColor lightGrayColor];
			Distance.view.backgroundColor = [UIColor whiteColor];
		}
		
		if(currentScreen==3)
		{
			T1.view.backgroundColor = [UIColor blueColor];
	
		}
	}
	
	if(currentEdit == 1)
	{
		Distance.view.backgroundColor = [UIColor blueColor];
		if(currentMode == 0) //time mode
		{
			Time.view.backgroundColor = [UIColor lightGrayColor];
			Paste.view.backgroundColor = [UIColor whiteColor];
		}
		else
		{
			Paste.view.backgroundColor = [UIColor lightGrayColor];
			Time.view.backgroundColor = [UIColor whiteColor];
		}
		
		if(currentScreen==3)
		{
			T2.view.backgroundColor = [UIColor blueColor];
			
		}

		
	}
	
	if(currentEdit ==2 )
	{
		Paste.view.backgroundColor = [UIColor blueColor];
		if(currentMode == 0) //time mode
		{
			Time.view.backgroundColor = [UIColor lightGrayColor];
			Distance.view.backgroundColor = [UIColor whiteColor];
		}
		else
		{
			Distance.view.backgroundColor = [UIColor lightGrayColor];
			Time.view.backgroundColor = [UIColor whiteColor];
		}		
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
	
	
	
	[self.navigationController.navigationBar setTintColor:settings.TintColor];
	
	UIBarButtonItem *bbiR = [[UIBarButtonItem alloc] initWithCustomView:topRightSegmentControl];
	UIBarButtonItem *bbiL = [[UIBarButtonItem alloc] initWithCustomView:topLeftSegmentControl];
	
	
	self.navigationItem.rightBarButtonItem = bbiR;
	self.navigationItem.leftBarButtonItem = bbiL;
	[bbiR release];
	[bbiL release];
	
	[bottomSegmentControl setTintColor:settings.TintColor];
	
	[toolBar setTintColor:settings.TintColor];
	
	
	picker.frame = CGRectMake(picker.frame.origin.x, picker.frame.origin.y+ 54, picker.frame.size.width, picker.frame.size.height-54);
	picker.delegate = pickerController;
	[picker setDataSource:pickerController];
	
	[pickerController setPicker:picker];
	[pickerController SetDistance:triathlonTime.useMile Current:0];
	
	currentEdit = -1;
	currentMode = 0;
	currentScreen = 0;
	[pickerController SetNone];
	self.view.backgroundColor= settings.BackgroundColor;
	
	
	
	
	Time.view.frame = CGRectMake(10, first, 300, 35);
	Distance.view.frame = CGRectMake(10, second, 300, 35);
	Paste.view.frame = CGRectMake(10, third, 300, 35);
	RaceTime.view.frame = CGRectMake(10, 125, 300, 35);
	
	T1.view.frame = CGRectMake(10, first, 300, 35);
	T2.view.frame = CGRectMake(10, second, 300, 35);
	T1.view.alpha = 0;
	T2.view.alpha =0;
	
	[self.view addSubview:Time.view];
	[self.view addSubview:Distance.view];
	[self.view addSubview:Paste.view];
	[self.view addSubview:RaceTime.view];
	[self.view addSubview:T1.view];
	[self.view addSubview:T2.view];
	
	Distance.view.frame= CGRectMake(10, first, 300, 35);
	Paste.view.frame= CGRectMake(10, second, 300, 35);
	Time.view.frame = CGRectMake(10, third, 300, 35);
	
	[Distance setActive:YES];
	[Paste setActive:YES];
	[Time setActive:NO];
	
	[self updateScreen];
}


-(void)animateTime
{
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	
	Distance.view.frame= CGRectMake(10, first, 300, 35);
	Paste.view.frame= CGRectMake(10, second, 300, 35);
	Time.view.frame = CGRectMake(10, third, 300, 35);
	
	[Distance setActive:YES];
	[Paste setActive:YES];
	[Time setActive:NO];
	
	[UIView commitAnimations];
}


-(void)animatePace
{
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	
	Distance.view.frame= CGRectMake(10, first, 300, 35);
	Time.view.frame= CGRectMake(10, second, 300, 35);
	Paste.view.frame = CGRectMake(10, third, 300, 35);
	
	[Distance setActive:YES];
	[Time setActive:YES];
	[Paste setActive:NO];
	
	[UIView commitAnimations];		
}

-(void)animateDistance
{
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	
	Time.view.frame= CGRectMake(10, first, 300, 35);
	Paste.view.frame= CGRectMake(10, second, 300, 35);
	Distance.view.frame = CGRectMake(10, third, 300, 35);
	
	[Time setActive:YES];
	[Paste setActive:YES];
	[Distance setActive:NO];
	
	[UIView commitAnimations];	
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
	[T1 release];
	[T2 release];
	[pickerController release];
	[triathlonTime release];
	
	[picker release];
	[topRightSegmentControl release];
	[topLeftSegmentControl release];
	[bottomSegmentControl release];
	[settings release];
	[toolBar release];
    [super dealloc];
}





@end
