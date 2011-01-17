//
//  wgtSettings.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-09.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface wgtSettings : NSObject {
	UIColor* TintColor;
	UIColor* BackgroundColor;
	UIColor* AlternateBackgroundColor;
}

@property(nonatomic,retain)UIColor* TintColor;
@property(nonatomic,retain)UIColor* BackgroundColor;
@property(nonatomic,retain)UIColor* AlternateBackgroundColor;
@end
