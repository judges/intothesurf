//
//  myPRUnitHandlerCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRUnitHandlerCreator.h"
#import "myPRmeterUnitHandler.h"
#import "myPRkgUnitHandler.h"

@implementation myPRUnitHandlerCreator

+(myPRUnitHandler*)CreateHandler:(myPRUnitHandlerType)t
{
	switch (t) {
		case myPRUnitHandlerTypeKgWeight:
			return [[myPRkgUnitHandler alloc]init];
			break;
		case myPRUnitHandlerTypeMeterDistance:
			return [[myPRmeterUnitHandler alloc]init];
			break;
		default:
			return nil;
			break;
	}
	
}
@end
