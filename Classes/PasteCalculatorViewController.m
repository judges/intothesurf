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
@synthesize hourTextField;
@synthesize minuteTextField;
@synthesize secondTextField;
@synthesize calculatorButton;

@synthesize paceLabel;
@synthesize closeButon;
@synthesize perWhat;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)keyboardWasShown:(NSNotification*)notification
{
	self.navigationItem.rightBarButtonItem = self.closeButon;
}

-(void)keyboardWasHidden:(NSNotification*)notification
{
	self.navigationItem.rightBarButtonItem = nil;
}

-(IBAction)CalculateButtonPressed:(id)sender
{
	if([distanceTextField.text isEqualToString:@""])
	{
		paceLabel.text = @"00:00:00";
	}
	else 
	{
		int hour =[hourTextField.text intValue];
		int minute = [minuteTextField.text intValue];
		int seconds = [secondTextField.text intValue];
		
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
	
	
}
-(IBAction)CloseButtonPressed:(id)sender
{
	[distanceTextField resignFirstResponder];
	[minuteTextField resignFirstResponder];
	[secondTextField resignFirstResponder];
	[hourTextField resignFirstResponder];
	
}

-(IBAction) SegmentChanges:(id)sender
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
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if(textField == distanceTextField)
	{
		if([string isEqualToString:@""] ||
		   [string isEqualToString:@"0"] ||
		   [string isEqualToString:@"1"] ||
		   [string isEqualToString:@"2"] ||
		   [string isEqualToString:@"3"] ||
		   [string isEqualToString:@"4"] ||
		   [string isEqualToString:@"5"] ||
		   [string isEqualToString:@"6"] ||
		   [string isEqualToString:@"7"] ||
		   [string isEqualToString:@"8"] ||
		   [string isEqualToString:@"9"])
		{
			return YES;
		}
		else
		{
			if([string isEqualToString:@"."])
			{
				NSString* str = textField.text;
				
				NSString* outputString = [str stringByReplacingCharactersInRange:range withString:string];
				int count=0;
				BOOL fail=NO;
				for (int i=0; i<[outputString length]; i++) {
					char c = [outputString characterAtIndex:i];
					
					if(c=='.')
					{
						if(i==0)
						{
							fail=YES;
							break;
						}
						count++;
					}
				}
				
				if([outputString floatValue]== HUGE_VAL || [outputString floatValue] == -HUGE_VAL || count>1 || fail)
				{
					return NO;
				}
				else {
					return YES;
				}

			}
			else 
			{
				return NO;
			}
		}

	}
	else {
		
		NSString* str = textField.text;
		
		NSString* outputString = [str stringByReplacingCharactersInRange:range withString:string];
		if([outputString intValue]>=60)
		{
			textField.text = @"59";
			return NO;
		}
		else {
			if([outputString length] > 2)
			{
				textField.text = [outputString substringFromIndex:[outputString length]  -2];
				return NO;
			}
			else 
			{
				return YES;
			}
		}
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lavamanbackground.jpg"]]];
	
	hourTextField.keyboardType = UIKeyboardTypeNumberPad;
	hourTextField.delegate = self;
	minuteTextField.keyboardType = UIKeyboardTypeNumberPad;
	minuteTextField.delegate = self;
	secondTextField.keyboardType = UIKeyboardTypeNumberPad;
	secondTextField.delegate = self;
	distanceTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
	distanceTextField.delegate = self;
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasHidden:)
												 name:UIKeyboardWillHideNotification 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardWillShowNotification 
											   object:nil];
	
	
	
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
    [super dealloc];
}


@end
