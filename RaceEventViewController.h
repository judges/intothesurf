//
//  RaceEventViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-20.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RaceEvent;
@class RaceDay;

@interface RaceEventViewController : UIViewController {
	UILabel* TimeLabel;
	UILabel* TextLabel;
	UIButton*ShowDeailsButton;
	
	
	id owner;
	SEL selector;
	NSDateFormatter* dateFormatter;
	
	@public
	RaceEvent* raceEvent;
	RaceDay* raceDay;
	
	
}

@property(nonatomic,readonly) RaceEvent* raceEvent;
@property(nonatomic,readonly) RaceDay* raceDay;

@property(nonatomic,retain) IBOutlet UILabel* TimeLabel;
@property(nonatomic,retain) IBOutlet UILabel* TextLabel;
@property(nonatomic,retain) IBOutlet UIButton*ShowDeailsButton;

-(id)initWithRaceEvent:(RaceEvent*)re InRaceDay:(RaceDay*)rd  Owner:(id)own Selector:(SEL)sel;

-(IBAction) raceDetailTouchUpInside:(id)sender;

@end
