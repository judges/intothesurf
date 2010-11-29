//
//  ThingsToSeeAndDo.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "FoodThingsToDo.h"

@interface ThingsToSeeAndDo : UIViewController {
	UIButton* FoodButton;
}

@property(nonatomic,retain) IBOutlet UIButton* FoodButton;
-(void)foodTouchUpInside:(id)sender;



@end
