//
//  LavamanAppDelegate.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright OHHI Ventures 2010. All rights reserved.
//

#import <UIKit/UIKit.h>b

@interface LavamanAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	NSString * appString;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

