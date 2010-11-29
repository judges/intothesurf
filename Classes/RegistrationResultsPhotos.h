//
//  RegistrationResultsPhotos.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButtonViewController;

@interface RegistrationResultsPhotos : UIViewController {
	CustomButtonViewController *reg;
	CustomButtonViewController *photo;
	CustomButtonViewController *res;

}


-(void)registrationTouchUpInside:(id)sender;
-(void)resultsTouchUpInside:(id)sender;
-(void)photosTouchUpInside:(id)sender;


@end
