//
//  ItemsToDo.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ItemsToDoViewController : UIViewController {
	NSMutableArray* viewControllers;
}


-(id)initWithItemArray:(NSArray*)array NavController:(UINavigationController*)navC;
@end
