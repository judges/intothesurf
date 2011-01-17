//
//  wgtTextEntryViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-09.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wgtSettings.h"

@interface wgtTextEntryViewController : UIViewController {
	UITextView *textView;
	UIBarButtonItem *btn;
	wgtSettings* _settings;
	
}
@property(nonatomic,retain) IBOutlet UITextView *textView;
@property(nonatomic,retain) UIBarButtonItem *btn;
-(IBAction)doneAction;
-(void)SetSettings:(wgtSettings*)s;
@end
