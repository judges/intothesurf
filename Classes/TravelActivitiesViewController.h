//
//  ThingsToSeeAndDo.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface TravelActivitiesViewController : UIViewController<ADBannerViewDelegate> {
	NSMutableArray* viewControllers;
	
	@private
	BOOL isBannerVisible;
	
}



-(id)initWithCategoryArray:(NSArray*)array NavController:(UINavigationController*)navC;


@end
