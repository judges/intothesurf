//
//  ThingsToSeeAndDoCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "ThingsToSeeAndDoCreator.h"
#include "Category.h"
#include "Item.h"

@implementation ThingsToSeeAndDoCreator


+(NSArray*) CreateThingsToSeeAndDo
{
	NSMutableArray *itemArray = [[NSMutableArray alloc]init];
	NSMutableArray *array =[[[NSMutableArray alloc]init] autorelease];
	
	[itemArray addObject:[Item initWithTitle:@"McDonalds" Image:@"nat_mcdonalds.jpg" Address:@"Seattle, Wa" Info:@"Promotion: 10% off" Link:@"Seattle"]];	
	[array addObject:[Category categoryWithImageName:@"food.png" Label:@"Food" Items:itemArray]];
	[itemArray release];
	itemArray =[[NSMutableArray alloc]init];

	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"activities.png" Label:@"Activities" Items:itemArray]];
	[itemArray release];
	itemArray =[[NSMutableArray alloc]init];

	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"shopping.png" Label:@"Shopping" Items:itemArray]];
	[itemArray release];
	itemArray =[[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"places.png" Label:@"Places" Items:itemArray]];
	[itemArray release];
	itemArray =[[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"hotel.png" Label:@"Hotels" Items:itemArray]];
	[itemArray release];
	itemArray =[[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"BikeWorks" Image:@"bikeworks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Kona-Boys" Image:@"karolina.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"gear.png" Label:@"Gear" Items:itemArray]];
	[itemArray release];
	
	return array;	
}
@end
