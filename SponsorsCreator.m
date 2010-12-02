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
	
	[itemArray addObject:[Item initWithTitle:@"Mc Donalds" Image:@"nat_mcdonalds.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Pepsi" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	[itemArray addObject:[Item initWithTitle:@"Pepsi" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	
	
	return itemArray;
}
@end
