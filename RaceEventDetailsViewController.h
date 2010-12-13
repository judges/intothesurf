//
//  RaceEventDetailsViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-20.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RaceEvent;
@class RaceDay;

@interface RaceEventDetailsViewController : UIViewController {

	UIButton *AddToCallendarButton;
	
	UILabel *Location;
	UILabel *Time;
	UITextView *Title;
	
	RaceDay *raceDay;
	RaceEvent *raceEvent;
	
	id owner;
	SEL selector;
	
	NSDateFormatter* dateFormatter;
	
	BOOL success;
}
@property BOOL success;
@property(nonatomic,retain)	RaceDay *raceDay;
@property(nonatomic,retain)	RaceEvent *raceEvent;

@property(nonatomic,retain) IBOutlet UIButton *AddToCallendarButton;

@property(nonatomic,retain) IBOutlet UILabel *Location;
@property(nonatomic,retain) IBOutlet UILabel *Time;

@property(nonatomic,retain) IBOutlet UITextView *Title;

-(id)initWithRaceEvent:(RaceEvent*)re InRaceDay:(RaceDay*)rd  Owner:(id)own Selector:(SEL)sel;


-(IBAction) CloseWindow:(id)sender;
-(IBAction) AddToCallendar:(id)sender;
@end
