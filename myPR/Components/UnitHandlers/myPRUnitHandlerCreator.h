//
//  myPRUnitHandlerCreator.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myPRUnitHandler.h"


@interface myPRUnitHandlerCreator : NSObject {

}

+(myPRUnitHandler*)CreateHandler:(myPRUnitHandlerType)t;



@end
