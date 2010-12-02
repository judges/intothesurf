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
	
	
	// food
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery" Image:@"konabrew.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://konabrewery.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://starbucks.com"]];	
	[array addObject:[Category categoryWithImageName:@"food_category.png" Label:@"Food" Items:itemArray]];
	[itemArray release];
	
	//activities
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"none" Image:@"xxx.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"activities_category.png" Label:@"Activities" Items:itemArray]];
	[itemArray release];
	
	//shopping
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"none" Image:@"xxx.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"shopping_category.png" Label:@"Shopping" Items:itemArray]];
	[itemArray release];
	
	//places
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"none" Image:@"xxx.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	[array addObject:[Category categoryWithImageName:@"places_category.png" Label:@"Sites" Items:itemArray]];
	[itemArray release];
	
	//hotels
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"75-5919 Alii Dr., Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://hilton.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"HolidayInn.JPG" Address:@"description" Info:@"Promotion: 15% off" Link:@"http://holidayinn.com"]];
	[itemArray addObject:[Item initWithTitle:@"Marriott" Image:@"marriott.png" Address:@"description" Info:@"Promotion: 20% off" Link:@"http://marriott.com"]];
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Lodging" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Bike Works" Image:@"bikeworks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://bikeworks.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Hammer" Image:@"hammer.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://hammer.com"]];	
	[itemArray addObject:[Item initWithTitle:@"XTerra" Image:@"xterra.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://xterrawetsuits.com"]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Gear" Items:itemArray]];
	[itemArray release];
	
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Karolina Wanke" Image:@"karolina.jpg" Address:@"75-135 Kamilo St., Kailua-Kona" Info:@"Promotion: 10% off" Link:@"http://intothesurf.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Luis De La Torre" Image:@"luis.jpg" Address:@"23 str, Kailua-Kona" Info:@"Something written here" Link:@"http://intothesurf.com"]];	
	[array addObject:[Category categoryWithImageName:@"karolina.jpg" Label:@"Coaching" Items:itemArray]];
	[itemArray release];

	
	itemArray =[[NSMutableArray alloc]init];
	[array addObject:[Category categoryWithImageName:@"" Label:@"Nightlife" Items:itemArray]];
	[itemArray release];
	
	
	return array;	
}
@end
