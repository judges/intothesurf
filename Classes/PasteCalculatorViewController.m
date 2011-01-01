//
//  PasteCalculatorViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "PasteCalculatorViewController.h"


@implementation PasteCalculatorViewController

@synthesize segment;
@synthesize mkTextField;
@synthesize distanceTextField;
@synthesize timeTextField;
@synthesize picker;
@synthesize paceLabel;
@synthesize perWhat;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {

        lock=FALSE;
		editMode = 0;
		distance = 0;
		time=0;
		pickerDataArray = [[NSMutableArray alloc] init];
		
		
		NSMutableArray *first = [[NSMutableArray alloc] init];
		for (int i=0;i<6; i++) {
			
			NSMutableArray * inner_first = [[NSMutableArray alloc] init];
			[inner_first addObject:@"-"];
			[first addObject:inner_first];
			[inner_first release];
		}
		
		
		
		
		[pickerDataArray addObject:first];
		[first release];
		
		
		NSMutableArray* second = [[NSMutableArray alloc]init];
		NSMutableArray* secondHour= [[NSMutableArray alloc]init];
		for(int i=0;i<24;i++)
		{
			[secondHour addObject: [NSString stringWithFormat:@"%d hrs",i]];
		}
		NSMutableArray* secondMinute= [[NSMutableArray alloc]init];
		for(int i=0;i<60;i++)
		{
			[secondMinute addObject: [NSString stringWithFormat:@"%d mins",i]];
		}
		NSMutableArray* secondSec= [[NSMutableArray alloc]init];
		for(int i=0;i<60;i++)
		{
			[secondSec addObject: [NSString stringWithFormat:@"%d secs",i]];
		}
		
		[second addObject:secondHour];
		[secondHour release];
		[second addObject:secondMinute];
		[secondMinute release];
		[second addObject:secondSec];
		[secondSec release];
		
		[pickerDataArray addObject:second];
		[second release];
		
		
		NSMutableArray* third = [[NSMutableArray alloc]init];
		NSMutableArray* thirdDec= [[NSMutableArray alloc]init];
		for(int i=0;i<100;i++)
		{
			[thirdDec addObject: [NSString stringWithFormat:@"%d",i]];
		}
		NSMutableArray* thirdFrac= [[NSMutableArray alloc]init];
		for(int i=0;i<100;i++)
		{
			[thirdFrac addObject: [NSString stringWithFormat:@".%02d",i]];
		}
		
		[third addObject:thirdDec];
		[thirdDec release];
		[third addObject:thirdFrac];
		[thirdFrac release];
		
		[pickerDataArray addObject:third];
		[third release];
		
		// Custom initialization
    }
    return self;
}




-(IBAction)CalculateButtonPressed:(id)sender
{
	/*
	if([distanceTextField.text isEqualToString:@""])
	{
		paceLabel.text = @"00:00:00";
	}
	else 
	{
		int hour =1;
		int minute = 2;
		int seconds = 3;		
		float distance = [distanceTextField.text floatValue];
		
		
		int totalSeconds = seconds + 60* minute + 3600 * hour;
		
		int secondsPerDistance = totalSeconds / distance;
		
		hour  = secondsPerDistance /3600;
		secondsPerDistance = secondsPerDistance%3600;
		minute = secondsPerDistance/60;
		secondsPerDistance = secondsPerDistance%60;
		seconds = secondsPerDistance;
		
		paceLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i",hour,minute,seconds];
		 
	}
	
	*/
}

-(IBAction) SegmentChanges:(id)sender
{
	[self updateDisplay];
	
}

-(void)updateDisplay
{
	if(self.segment.selectedSegmentIndex==0)
	{
		mkTextField.text = @"km";
		perWhat.text = @"per km";
	}
	else 
	{
		mkTextField.text =@"miles";
		perWhat.text =@"per mile";
	}
	
	int h = time/3600;
	int m = (time%3600)/60;
	int s = time%60;
	
	int dec = floor(distance);
	int frac = floor(distance*100);
	frac = frac%100;
	
	[distanceTextField setTitle:[NSString stringWithFormat:@"%d.%02d",dec,frac] forState:UIControlStateNormal];
	[timeTextField setTitle:[NSString stringWithFormat:@"%d:%02d:%02d",h,m,s] forState:UIControlStateNormal];

	
	int secondsPerDistance;
	if(distance>0)
	{
		secondsPerDistance= time / distance;
	}
	else
	{
		secondsPerDistance=0;
	}

	
	h  = secondsPerDistance /3600;
	secondsPerDistance = secondsPerDistance%3600;
	m = secondsPerDistance/60;
	secondsPerDistance = secondsPerDistance%60;
	s = secondsPerDistance;
	
	paceLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i",h,m,s];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	picker.frame = CGRectMake(picker.frame.origin.x, picker.frame.origin.y+ 54, picker.frame.size.width, picker.frame.size.height-54);
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
	[self updateDisplay];
    [super viewDidLoad];
}



-(void)initPicker
{
	[picker reloadAllComponents];
	if(editMode==1)
	{
		int h = time/3600;
		int m = (time%3600)/60;
		int s = time%60;
		[picker selectRow:h inComponent:0 animated:YES ];
		[picker selectRow:m inComponent:1 animated:YES ];
		[picker selectRow:s inComponent:2 animated:YES ];
	}
	if(editMode==2)
	{
		int dec = floor(distance);
		int frac = floor(distance*100);
		frac = frac % 100;
		[picker selectRow:dec inComponent:0 animated:YES ];
		[picker selectRow:frac inComponent:1 animated:YES ];
	}

}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if(!lock)
	{
	if(editMode==1)
	{
		time = [picker selectedRowInComponent:0]*3600 + 
			   [picker selectedRowInComponent:1]*60 +
		[picker selectedRowInComponent:2];
	}
	if(editMode==2)
	{
		distance =[picker selectedRowInComponent:0]+
		((float)[picker selectedRowInComponent:1]/100);
	}
	
	[self updateDisplay];
	}
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[[pickerDataArray objectAtIndex:editMode] objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[[pickerDataArray objectAtIndex:editMode] objectAtIndex:component ]objectAtIndex:row];
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [[pickerDataArray objectAtIndex:editMode]count];
}

-(IBAction)textClick:(id)sender
{
	lock = YES;
	if(sender == distanceTextField)
	{
		editMode =2;
	}
	if(sender ==timeTextField)
	{
		editMode = 1;
	}
	[self initPicker];
	lock=NO;
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
	[pickerDataArray release];
    [super dealloc];
}


@end
