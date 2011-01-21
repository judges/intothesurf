//
//  myPREnterName.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPRRecord.h"
#import "myPRSettings.h"

@interface myPREnterName : UIViewController {
	UITextField *TextView;
	myPRRecord* _record;
	BOOL setName;
	myPRSettings*_settings;
}
-(id)initWithRecord:(myPRRecord*)r setName:(BOOL)sn;
-(void)SetSettings:(myPRSettings*)s;
-(IBAction)ValueChanged;

@property(nonatomic,retain) IBOutlet UITextField *TextView;

@end
