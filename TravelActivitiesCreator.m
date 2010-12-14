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
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery" Image:@"konabrew.jpg"   Address:@"23 str, Kailua-Kona" Info:@"Promotion: coming soon" Link:@"www.konabrewery.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Jackie Reys"  Image:@"jackiereys.jpg" Address:@"75-5995 Kuakini Highway, Kailua-Kona, HI" Info:@"Promotion: coming soon" Link:@"www.jackiereys.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Starbucks"    Image:@"starbucks.jpg"  Address:@"23 str, Kailua-Kona" Info:@"Promotion: coming soon" Link:@"www.starbucks.com"]];	
	[array addObject:[Category categoryWithImageName:@"food_category.png" Label:@"Food" Items:itemArray]];
	[itemArray release];
	
	//activities
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Fair Wind Cruises" Image:@"fairwind.jpg" Address:@"78-7130 Kaleiopapa Street, Kailua-Kona" Info:@"Promotion: coming soon" Link:@"www.fair-wind.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Ocean Sports"      Image:@"fairwind.jpg" Address:@"69-275 Waikoloa Beach Drive HI 96738" Info:@"Promotion: coming soon" Link:@"hawaiioceansports.com"]];		
	[array addObject:[Category categoryWithImageName:@"activities_category.png" Label:@"Activities" Items:itemArray]];
	[itemArray release];
	
	//shopping
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Queens Marketplace" Image:@"comingsoon.jpg" Address:@"lavamantriathlon.com" Info:@"Promotion: " Link:@"www.lavamantriathlon.com"]];	
	[array addObject:[Category categoryWithImageName:@"shopping_category.png" Label:@"Shopping" Items:itemArray]];
	[itemArray release];
	
	//places
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Coming Soon"     Image:@"comingsoon.jpg" Address:@"lavamantriathlon.com" Info:@"Promotion: " Link:@"www.lavamantriathlon.com"]];	
	[array addObject:[Category categoryWithImageName:@"places_category.png" Label:@"Sites" Items:itemArray]];
	[itemArray release];
	
	//hotels
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton"          Image:@"hilton.jpg"     Address:@"75-5919 Alii Dr., Kailua-Kona" Info:@"Promotion: " Link:@"www.hilton.com"]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Lodging" Items:itemArray]];
	[itemArray release];
	
	//gear
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Bike Works"      Image:@"bikeworks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: " Link:@"www.bikeworks.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Hammer"          Image:@"hammer.jpg"    Address:@"4952 Whitefish Stage Rd, Whitefish, MT 59937" Info:@"Promotion: " Link:@"www.hammernutrition.com"]];	
	[itemArray addObject:[Item initWithTitle:@"XTerra Wetsuits" Image:@"xterra.jpg"    Address:@"8380 Miramar Mall, San Diego, CA 92121" Info:@"Promotion: " Link:@"www.xterrawetsuits.com"]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Gear" Items:itemArray]];
	[itemArray release];
	
	//coaching
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Eric Neilsen"    Image:@"karolina.jpg" Address:@"Kailua-Kona, HI" Info:@"" Link:@"www.coachericneilsen.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Luis DeLa Torre" Image:@"luis.jpg"     Address:@"Kailua-Kona, HI" Info:@"" Link:@"www.luisdelatorre.com"]];	
	[array addObject:[Category categoryWithImageName:@"karolina.jpg" Label:@"Coaching" Items:itemArray]];
	[itemArray release];
	
	//nightlife
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Coming Soon" Image:@"comingsoon.jpg"   Address:@"lavamantriathlon.com" Info:@"Promotion: " Link:@"www.lavamantriathlon.com"]];	
	[array addObject:[Category categoryWithImageName:@"" Label:@"Nightlife" Items:itemArray]];
	[itemArray release];
		
	return array;	
}
@end
