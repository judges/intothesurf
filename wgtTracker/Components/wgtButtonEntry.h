//
//  wgtButtonEntry.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface wgtButtonEntry : UIViewController {
	UILabel *TitleLabel;
	UITextField *TitleText;
	
	id owner;
	SEL action;
}
@property(nonatomic,retain) IBOutlet UILabel *TitleLabel;
@property(nonatomic,retain) IBOutlet UITextField *TitleText;

-(id)initWithOwner:(id)own andAction:(SEL)act;


-(void)SetSelected:(BOOL)s;
@end
