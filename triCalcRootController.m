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
#import "triCalcTemplateDistance.h"
#import "SHK.h"

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
	MILEFACTOR = 0.621371192;
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
	
	if(currentScreen!=3)
	{
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
	if(currentEdit==-1)
	{
		return;	
	}
	
	float value = [pickerController GetValue];
	//if(currentScreen == 3)
	//{
	//	value = [pickerController GetValue:3];
	//}
	//else {
	//	value = [pickerController GetValue:currentEdit];
	//}

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
			switch (currentScreen) 
			{
				case 0: // swim;
					[pickerController SetDistanceForSwim:triathlonTime.useMile Current:val];
					break;
				case 1: // bike
					[pickerController SetDistance:triathlonTime.useMile Current:val];
					break;
				case 2: // run
					[pickerController SetDistanceForRun:triathlonTime.useMile Current:val];
					break;
			}
			currentEdit = 1;
		}
		
		
		
		
	}else if(sender == Paste)
	{
		if(currentMode !=2)
		{
			float val = [triathlonTime GetValueInEdit:2 InScreen:currentScreen];
			
			switch (currentScreen) {
				case 0: //swim
					[pickerController SetSwimPace:triathlonTime.useMile Current:val];
					break;
				case 1: //bike
					[pickerController SetAvgSpeed:triathlonTime.useMile Current:val];
					break;
				case 2: //run
					[pickerController SetRunPace:triathlonTime.useMile Current:val];
					break;
			}
			currentEdit= 2;
		}
	}else if(sender == T1)
	{
		if(currentEdit!=0)
		{
			float val = [triathlonTime GetValueInEdit:0 InScreen:currentScreen];
			[pickerController SetTransit:triathlonTime.useMile Current:val];
			currentEdit= 0;
		}
	}else if(sender == T2)
	{
		if(currentEdit!=1)
		{
			float val = [triathlonTime GetValueInEdit:1 InScreen:currentScreen];
			[pickerController SetTransit:triathlonTime.useMile Current:val];
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

-(NSString*)FormatSwimPace:(float)v
{
	float val;
	if(v==0)
	{
		val =0;
	}
	else
	{
		val = 60/v;
	}
	val = val*60;
	
	val = val/10; //per 100 meters.
	
	int minutes = val / 60;
	int seconds = floor(val);
	seconds = seconds % 60;
	
	
	return [NSString stringWithFormat:@"%d:%02d",minutes,seconds];
}
-(NSString*)FormatRunPace:(float)v
{
	float val=v;
	
	if(triathlonTime.useMile)
	{
		val = val * MILEFACTOR;
	}
	
	if(val==0)
	{
		val =0;
	}
	else
	{
		val = 60/val;
	}
	val = val*60;
	
	int minutes = val / 60;
	int seconds = floor(val);
	seconds = seconds % 60;
	
		
	return [NSString stringWithFormat:@"%d:%02d",minutes,seconds];
}

-(NSString*)FormatAvgSpeed:(float)v
{
	float val=v;
	if(triathlonTime.useMile)
	{
		val= v * MILEFACTOR;
	}
	 
	
	int decimal = floor(val);
	int frac = floor(val*100);
	frac = frac % 100;
	
	return [NSString stringWithFormat:@"%d.%02d",decimal,frac];
	
}

-(NSString*)FormatSwimDistance:(float)v
{
	if(triathlonTime.useMile)
	{
		float val = v * MILEFACTOR;
		
		int decimal = floor(val);
		int fract = floor(val*100);
		fract = fract%100;
		
		return [NSString stringWithFormat:@"%d.%02d",decimal,fract];
		
	}
	else 
	{
		int decimal = (v*1000);
		return [NSString stringWithFormat:@"%d",decimal];
	}


}

-(NSString*)FormatRunDistance:(float)v
{
	int decimal = (v*1000);
	return [NSString stringWithFormat:@"%d",decimal];
}

-(NSString*)FormatBikeDistance:(float)v
{
	float val = v;
	if(triathlonTime.useMile)
	{
		val = val * MILEFACTOR;
	}
	int decimal = floor(val);
	int fractal = floor(val*100);
	fractal = fractal % 100;
	
	return [NSString stringWithFormat:@"%d.%02d",decimal,fractal];
}


-(void)updateLabels
{
	if(triathlonTime.useMile)
	{
		switch (currentScreen) {
			case 0:
				Distance.MetricsLabel.text =@"mile";
				Paste.MetricsLabel.text = @"per 100m";
				break;
			case 1:
				Distance.MetricsLabel.text =@"miles";
				Paste.MetricsLabel.text = @"mph";
				break;
			case 2:
				Distance.MetricsLabel.text =@"meters";
				Paste.MetricsLabel.text=@"per mile";
				break;
		}
		
	
	}
	else
	{
		switch (currentScreen) {
			case 0:
				Distance.MetricsLabel.text =@"meters";
				Paste.MetricsLabel.text = @"per 100m";
				break;
			case 1:
				Distance.MetricsLabel.text =@"km";
				Paste.MetricsLabel.text = @"kph";
				break;
			case 2:
				Distance.MetricsLabel.text =@"meters";
				Paste.MetricsLabel.text=@"per km";
				break;
		}
	}
}

-(void)updateScreen
{
	
	[self updateLabels];
	
	UIColor* selectionColor = [UIColor colorWithRed:0 green:0xB1/255.0 blue:0xE6/255.0 alpha:1];
	
	if(currentScreen !=3)
	{
		Time.TextField.text = [self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:currentScreen]];
		
		switch (currentScreen) {
			case 0:
				Distance.TextField.text =[self FormatSwimDistance: [triathlonTime GetValueInEdit:1 InScreen:currentScreen]];
				break;
			case 1:
				Distance.TextField.text =[self FormatBikeDistance: [triathlonTime GetValueInEdit:1 InScreen:currentScreen]];
				break;
			case 2:
				Distance.TextField.text =[self FormatRunDistance: [triathlonTime GetValueInEdit:1 InScreen:currentScreen]];
				break;
		}
		

		switch (currentScreen) {
			case 0:
				
				Paste.TextField.text = [self FormatSwimPace:[triathlonTime GetValueInEdit:2 InScreen:currentScreen]];
				break;
			case 1:
				Paste.TextField.text = [self FormatAvgSpeed: [triathlonTime GetValueInEdit:2 InScreen:currentScreen]];
				break;
			case 2: //run
				Paste.TextField.text = [self FormatRunPace: [triathlonTime GetValueInEdit:2 InScreen:currentScreen]];	
				break;
		}
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
	
	
	switch (currentEdit) {
		case -1:
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
			break;
		case 0:
			Time.view.backgroundColor = selectionColor;
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
				T1.view.backgroundColor = selectionColor;
				
			}
			break;
		case 1:
			Distance.view.backgroundColor = selectionColor;
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
				T2.view.backgroundColor = selectionColor;
				
			}
			break;
		case 2:
			Paste.view.backgroundColor = selectionColor;
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
			break;
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
	
	[Distance.DetailsButton addTarget:self action:@selector(selectDistance:) forControlEvents:UIControlEventTouchUpInside];

	
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

-(IBAction) share:(id)sender
{
	
	NSString *myGoals=
	[NSString stringWithFormat:@"My goal:\nSwim: %@ %@ in %@\nBike: %@ %@ in %@\nRun: %@ %@ in %@\nT1: %@ T2: %@\nTotal: %@"
								,[self FormatSwimDistance: [triathlonTime GetValueInEdit:1 InScreen:0]]
								,triathlonTime.useMile? @"mile":@"meters"
								,[self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:0]]
								//,[self FormatSwimPace:[triathlonTime GetValueInEdit:2 InScreen:0]]
								//,@"per 100m"
								,[self FormatBikeDistance:[triathlonTime GetValueInEdit:1 InScreen:1]]
								,triathlonTime.useMile? @"mile":@"km"
								,[self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:1]]
								//,[self FormatAvgSpeed:[triathlonTime GetValueInEdit:2 InScreen:1]]
								//,triathlonTime.useMile? @"mph":@"kph"
								,[self FormatRunDistance:[triathlonTime GetValueInEdit:1 InScreen:2]]
								,@"meters"
								,[self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:2]]
								//,[self FormatRunPace:[triathlonTime GetValueInEdit:2 InScreen:2]]
								//,triathlonTime.useMile? @"per mile":@"per km" 
								,[self FormatTime:[triathlonTime GetValueInEdit:0 InScreen:3]]
								,[self FormatTime:[triathlonTime GetValueInEdit:1 InScreen:3]]
								,[self FormatTime: [triathlonTime GetValueInEdit:0 InScreen:0]
								  +[triathlonTime GetValueInEdit:0 InScreen:1]
								  +[triathlonTime GetValueInEdit:0 InScreen:2]
								  +[triathlonTime GetValueInEdit:0 InScreen:3]
								  +[triathlonTime GetValueInEdit:1 InScreen:3]]
	];
	
	SHKItem *item = [SHKItem text:myGoals];
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
	
	[actionSheet showInView:self.view];
	
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

-(void)selectDistance:(id)sender
{
	if(currentMode == 1)
	{
		return ;
	}
	
	
	
	currentEdit = 1;
	
	
	
	triCalcTemplateDistance * tmp = [[triCalcTemplateDistance alloc] initWithBackground:self.view.backgroundColor 
																				  owner:self 
																			   selector:@selector(distanceSelected:)
																				 Screen:currentScreen
																				UseMile:triathlonTime.useMile];
	
	[self.navigationController pushViewController:tmp animated:YES];
	[tmp release];
}

-(void)distanceSelected:(NSNumber*)newDistance
{
	
	[triathlonTime updateValue:[newDistance floatValue] InEdit:currentEdit InScreen:currentScreen InMode:currentMode];
	
	if(currentScreen!=3)
	{
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
