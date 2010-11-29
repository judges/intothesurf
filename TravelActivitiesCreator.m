//
//  ThingsToSeeAndDoCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "TravelActivitiesCreator.h"
#include "Category.h"
#include "Item.h"

@implementation TravelActivitiesCreator


+(NSArray*) CreateTravelActivities
{
	NSMutableArray *itemArray = [[NSMutableArray alloc]init];
	NSMutableArray *array =[[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"Mc Donalds" Image:@"nat_mcdonalds.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"Kona"]];	
	[array addObject:[Category categoryWithImageName:@"food_category.png" Label:@"Food" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"Holiday_Inn_1_square.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"activities_category.png" Label:@"Activities" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"shopping_category.png" Label:@"Shopping" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"places_category.png" Label:@"Places" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Hotels" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Gear" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[array addObject:[Category categoryWithImageName:@"" Label:@"<empty>" Items:itemArray]];
	[itemArray release];

	
	itemArray =[[NSMutableArray alloc]init];
	[array addObject:[Category categoryWithImageName:@"" Label:@"<empty> " Items:itemArray]];
	[itemArray release];
	
	
	return array;	
}
@end
