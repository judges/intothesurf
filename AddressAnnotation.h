//
//  AddressAnnotation.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-16.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AddressAnnotation : NSObject<MKAnnotation> {

	CLLocationCoordinate2D coordinate;
	NSString* mTitle;
	NSString* mSubtitle;
}

-(NSString*)subtitle;
-(NSString*)title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c Title:(NSString*)t Message:(NSString*)m;

@end
