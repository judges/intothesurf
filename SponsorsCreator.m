//
//  SponsorsCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "SponsorsCreator.h"
#include "Item.h"

@implementation SponsorsCreator


+(NSArray*) CreateSponsors
{
	NSMutableArray* itemArray = [[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"McDonalds" Image:@"mcdonalds.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"HolidayInn.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Oomph!" Image:@"oomph.png" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Hammer" Image:@"hammer.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"HawaiiPhotoman" Image:@"hawaiiphotoman.jpg" Address:@"Dayton, Ohio" Info:@"Promotion: 5% off" Link:@"" ll1:39.75049 ll2:-84.193726]];
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery" Image:@"konabrew.jpg" Address:@"75-5629 Kuakini Highway, Kailua-Kona, Hi 96740" Info:@"Promotion: 5% off" Link:@"http://konabrewingco.com" ll1:19.641961 ll2:-155.996461]];
	[itemArray addObject:[Item initWithTitle:@"XTerra" Image:@"xterra.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	
	
	
	return itemArray;
}
@end
