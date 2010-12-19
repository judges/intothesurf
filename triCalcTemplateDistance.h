//
//  triCalcTemplateDistance.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-19.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface triCalcTemplateDistance : UITableViewController {
	NSMutableArray* titles;
	NSMutableArray* values;
	
	id owner;
	SEL selector;
	
	UIColor *color;
}
-(id)initWithBackground:(UIColor*)bgColor owner:(id)o selector:(SEL)s Screen:(int)scr;

@end
