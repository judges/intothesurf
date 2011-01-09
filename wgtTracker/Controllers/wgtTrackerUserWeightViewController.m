//
//  wgtTrackerUserWeightViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtTrackerUserWeightViewController.h"
#import "wgtWeightPicker.h"
#import "wgtTrackerEntryCell.h"
#import "wgtWeightEntry.h"
#import "wgtWeightGraphViewController.h"

@implementation wgtTrackerUserWeightViewController
@synthesize weightPicker,closePickerButton,editTableButton,addTableButton,mTableView;

-(id)initWithManagedObject:(NSManagedObject*)obj andConext:(NSManagedObjectContext*)context
{
	self = [super init];
	if(self)
	{
		currentObject = obj;
		currentContext = context;
		currentUser = [wgtUser UserFromObject:currentObject];
		[currentObject retain];
		[currentUser retain];
		
		self.navigationItem.title = currentUser.Name;
	
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
	
	targetWeight = [[wgtButtonEntry alloc] initWithOwner:self andAction:@selector(EnterTargetWeight)];
	targetWeight.view.frame = CGRectMake(40, 6, 240, 40);
	targetWeight.TitleLabel.text =@"Target Weight:";
	[self.view addSubview:targetWeight.view];
	
	weightPickerController = [[wgtWeightPicker alloc] initWithPicker:weightPicker Owner:self Selector:@selector(WeightChanged)];
	
	
	[weightPickerController SetUseImperial:currentUser.UseImperial];
	[weightPickerController SetWeight:currentUser.TargetWeight];
	
	targetWeight.TitleText.text=[wgtUser FormatWeight:currentUser.TargetWeight UseImp:currentUser.UseImperial] ;
	
	[mTableView setDelegate:self];
	[mTableView setDataSource:self];

	mTableView.allowsSelectionDuringEditing= YES;
	mTableView.allowsSelection=NO;
	
    [super viewDidLoad];
}


-(void)WeightChanged
{
	currentUser.TargetWeight = [weightPickerController GetWeight];
	[wgtUser EditUser:currentUser ToObject:currentObject];
	NSError*error;
	[currentContext save:&error];
	
	
	targetWeight.TitleText.text= [wgtUser FormatWeight:currentUser.TargetWeight UseImp:currentUser.UseImperial];
	
}

-(IBAction)EnterTargetWeight
{
	
	[targetWeight SetSelected:TRUE];
	self.navigationItem.rightBarButtonItem = closePickerButton;
	greyOutView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	greyOutView.backgroundColor = [UIColor blackColor];
	greyOutView.alpha = 0.4;
	
	
	[self.view addSubview:greyOutView];
	[self.view bringSubviewToFront:weightPicker];
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	weightPicker.frame=CGRectMake(0, weightPicker.frame.origin.y - 256, 320, weightPicker.frame.size.height);
	[UIView commitAnimations];
	[greyOutView release];
}

-(IBAction)CommitTargetWeight
{
	[targetWeight SetSelected:FALSE];
	self.navigationItem.rightBarButtonItem=nil;
	[greyOutView removeFromSuperview];
	
	[UIView beginAnimations:@"" context:nil];
	[UIView setAnimationDuration:0.5];
	weightPicker.frame=CGRectMake(0, weightPicker.frame.origin.y + 256, 320, weightPicker.frame.size.height);
	[UIView commitAnimations];
}

-(IBAction)ShowGraph
{
	NSMutableArray* array = [[NSMutableArray alloc] init];
	
	NSArray* oldArray =[self GetArray];
	
	for(int i=0;i<[oldArray count];i++)
	{
		[array addObject: [wgtWeightEntry EntryFromObject:[oldArray objectAtIndex:   [oldArray count]-i-1  ]]  ];
		
	}

	
	wgtWeightGraphViewController * sd = [[wgtWeightGraphViewController alloc]initWithDataArray:array User:currentUser];
	[array release];
	[self.navigationController pushViewController:sd animated:YES];
	[sd release];
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
	[addTableButton release];
	[editTableButton release];
	[mTableView release];
	[currentObject release];
	[currentUser release];
	[weightPickerController release];
	[closePickerButton release];
	[targetWeight release];
	[weightPicker release];
    [super dealloc];
}


#pragma mark -
#pragma mark TableViewDataSource

-(NSArray*) GetArray
{
	return [wgtUser GetWeights:currentObject ToContext:currentContext];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger) tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [[self GetArray] count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	editedIndex = indexPath.row;
	wgtWeightEntry* entry= [wgtWeightEntry EntryFromObject:[[self GetArray] objectAtIndex:indexPath.row]];
	modalWindow = [[wgtTrackerWeightEntryViewController alloc]initWithOwner:self Entry:entry User:currentUser];
	IsNew = NO;
	[self.navigationController.view addSubview:modalWindow.view];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path

		NSArray* objects = [self GetArray];
		NSManagedObject* obj = [objects objectAtIndex:indexPath.row];
		
	
		[wgtWeightEntry DeleteEntry:obj FromObject:currentObject FromContext:currentContext];
        
        // Save the context.
        NSError *error = nil;
        if (![currentContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
		[mTableView beginUpdates];
		[mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];
		[mTableView endUpdates];
		

	}   	
	
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"cell1";
    
	wgtTrackerEntryCell *cell = (wgtTrackerEntryCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"wgtTrackerEntryCell" owner:nil options:nil];
		for(id cb in nibObjects)
		{
			if([cb isKindOfClass:[wgtTrackerEntryCell class]])
			{
				cell = (wgtTrackerEntryCell *)cb;
			}
		}
    }
	
	wgtWeightEntry* tmpWeightEntry = [wgtWeightEntry EntryFromObject:[[self GetArray] objectAtIndex:indexPath.row]];

	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"MMM dd YYYY"];
	
	cell.Date.text = [dateFormatter stringFromDate:tmpWeightEntry.Date];
	[dateFormatter release];

	cell.Weight.text=[wgtUser FormatWeight:tmpWeightEntry.Weight UseImp:currentUser.UseImperial];
	cell.Bmi.text = [NSString stringWithFormat:@"%1.2f",[wgtUser BMIforWeight:tmpWeightEntry.Weight andHeight:currentUser.Height]];
	cell.Fat.text = [NSString stringWithFormat:@"%d %@",tmpWeightEntry.Fat,@"%"];
	cell.Water.text = [NSString stringWithFormat:@"%d %@",tmpWeightEntry.Water,@"%"];	
	
	
	return cell;
	
}

-(IBAction)AddMeasure
{
	wgtWeightEntry* newEntry = [[wgtWeightEntry alloc]init];

	if([[self GetArray]count]>0)
	{
	newEntry.Weight =[wgtWeightEntry EntryFromObject:[[self GetArray ] objectAtIndex:0]].Weight;
	}
		modalWindow = [[wgtTrackerWeightEntryViewController alloc] initWithOwner:self Entry:newEntry User:currentUser];
	[newEntry release];
	IsNew = YES;
	
	[self.navigationController.view addSubview:modalWindow.view];
	
}

-(IBAction)EditMeasure
{
	if(mTableView.editing)
	{
		[editTableButton setStyle:UIBarButtonItemStyleBordered];
		[editTableButton setTitle:@"Edit"];
		[mTableView setEditing:NO animated:YES];
	}
	else 
	{
		[editTableButton setStyle:UIBarButtonItemStyleDone];
		[editTableButton setTitle:@"Done"];
		[mTableView setEditing:YES animated:YES];
	}
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex==0)
	{
		wgtWeightEntry* editedEntry = [modalWindow getCurrentEntry];
		if(IsNew)
		{
			NSIndexPath*p =[NSIndexPath indexPathForRow:editedIndex inSection:0];
			
			id obj = [[self GetArray] objectAtIndex: editedIndex];
			
			[wgtWeightEntry EditEntry:editedEntry ToObject:obj];
			
			
					
			NSError *error = nil;
			if (![currentContext save:&error]) {
				/*
				 Replace this implementation with code to handle the error appropriately.
				 
				 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
				 */
				NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
				abort();
			}
			
			
			[mTableView beginUpdates];
			[mTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			[mTableView endUpdates];
			
		
			
			
		}
		else
		{
			NSIndexPath*p =[NSIndexPath indexPathForRow:editedIndex inSection:0];
			
			NSIndexPath*p1 = [NSIndexPath indexPathForRow:indexToDelete inSection:0];
			id obj = [[self GetArray] objectAtIndex: editedIndex];
			[wgtWeightEntry EditEntry:editedEntry ToObject:obj];
			
			[wgtWeightEntry DeleteEntry:[[self GetArray] objectAtIndex:indexToDelete] FromObject:currentObject FromContext:currentContext];
			

			
			NSError* error;
			[currentContext save:&error];
			
			
			
			
			[mTableView beginUpdates];
			[mTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			[mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: p1] withRowAnimation:UITableViewRowAnimationFade];
			
			[mTableView endUpdates];
			

			//wgtWeightEntry*editedEntry = [modalWindow getCurrentEntry];
					
		}
		
		[modalWindow.view removeFromSuperview];
		[modalWindow release];		
	}
}

-(void)EditDone
{
	if(IsNew)
	{
		wgtWeightEntry* newEntry = [modalWindow getCurrentEntry];
		NSArray* arr = [self GetArray];
		BOOL correct = YES;
		for(int i=0;i<[arr count];i++)
		{
			wgtWeightEntry* compareToEnty = [wgtWeightEntry EntryFromObject:[arr objectAtIndex:i]];
			if ([compareToEnty.Date isEqualToDate:newEntry.Date]   )
			{
				UIActionSheet* actionSheet = [[UIActionSheet alloc]
											 initWithTitle:@"Entry with given date already extist. Do You want to overwrite it ?" 
											 delegate:self 
											 cancelButtonTitle:@"No" 
											 destructiveButtonTitle:nil 
											 otherButtonTitles:@"Yes",nil];
				
				[actionSheet showInView:modalWindow.view];
				[actionSheet release];
				editedIndex = i;
				correct = NO;
				break;
			}

		}
		
		if(correct)
		{
			[wgtWeightEntry AddEntry:newEntry ToContext:currentContext ToObject:currentObject];
			NSError* error;
			[currentContext save:&error];
			
			[mTableView reloadData];
			
			[modalWindow.view removeFromSuperview];
			[modalWindow release];		

		}
	}
	else
	{
		wgtWeightEntry* editedEntry = [modalWindow getCurrentEntry];
		NSArray* arr = [self GetArray];
		BOOL correct = YES;
		for(int i=0;i<[arr count];i++)
		{
			wgtWeightEntry* compareToEnty = [wgtWeightEntry EntryFromObject:[arr objectAtIndex:i]];
			if ([compareToEnty.Date isEqualToDate:editedEntry.Date] && i!=editedIndex  )
			{
				UIActionSheet* actionSheet = [[UIActionSheet alloc]
											  initWithTitle:@"Entry with given date already extist. Do You want to overwrite it ?" 
											  delegate:self 
											  cancelButtonTitle:@"No" 
											  destructiveButtonTitle:nil 
											  otherButtonTitles:@"Yes",nil];
				
				[actionSheet showInView:modalWindow.view];
				[actionSheet release];
				correct = NO;
				indexToDelete = editedIndex;
				editedIndex= i;
				break;				
			}
		}
		if(correct)
		{
			NSIndexPath*p =[NSIndexPath indexPathForRow:editedIndex inSection:0];
			
			id obj = [[self GetArray] objectAtIndex: editedIndex];
			[wgtWeightEntry EditEntry:editedEntry ToObject:obj];
			
			NSError* error;
			[currentContext save:&error];
			
			[mTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			
			[modalWindow.view removeFromSuperview];
			[modalWindow release];		

			
		}
	}
	
	
	
		
	
}
-(void)EditCancel
{
	[modalWindow.view removeFromSuperview];
	[modalWindow release];
}

@end
