//
//  myPRSelectIcon.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPRRecord.h"
#import "myPRSettings.h"

@interface myPRSelectIcon : UITableViewController {
	myPRRecord* _record;
	myPRSettings*_settings;
	
	NSMutableArray* _iconArray;
}
-(id)initWithRecord:(myPRRecord*)r;
-(void)SetSettings:(myPRSettings*)s;

+(NSString*)StringForIcon:(NSString*)icon;
@end
