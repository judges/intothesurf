//
//  RaceInformationViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RaceEventViewController;
@class RaceEventDetailsViewController;

@interface RaceInformationViewController : UIViewController<UIActionSheetDelegate> {
	NSArray *raceInfoArray;
	UIBarButtonItem *barButton;
	NSDateFormatter* dateFormatter;
	NSMutableDictionary*dict;
	
	NSMutableArray* dictionaryOdViewControllers;
	
	RaceEventDetailsViewController* currentDetails;
	
	UIScrollView*scrollView;
	
	UIView *greyView;
	
	BOOL singleEvent;
}




-(void)HandleDetailWindow:(RaceEventDetailsViewController*)redvc;

-(id)initWithRaceInfo:(NSArray*)ri;


-(void)showDetails:(RaceEventViewController*)revc;

-(void)disposeCurrentDetails;

@property(nonatomic,retain) IBOutlet UIBarButtonItem* barButton;
-(IBAction)save:(id)sender;


@end
