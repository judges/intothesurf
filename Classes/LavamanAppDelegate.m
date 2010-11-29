//
//  LavamanAppDelegate.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright OHHI Ventures 2010. All rights reserved.
//

#import "LavamanAppDelegate.h"
//#import "RootViewController.h"


@implementation LavamanAppDelegate

@synthesize window;
@synthesize navigationController;



#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    

	
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
	

	
	
	NSLog(@"Registering");
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
	
    return YES;
}



- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
   NSLog(@"Registered");
	
	NSString *deviceToken = [[devToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
	deviceToken = [deviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
	
	appString = deviceToken;
	
	
	
	NSLog(  [NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/login?deviceToken=%@", appString]);
	
	
	[[NSUserDefaults standardUserDefaults] setValue:appString forKey:@"deviceToken"];
	
	
	NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/login?deviceToken=%@", appString]]];
	[NSURLConnection connectionWithRequest:req delegate:self];
	
	[[NSNotificationCenter defaultCenter]postNotificationName:@"deviceTokenReceived" object:nil];
}


- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Error in registration. Error: %@", err);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"saveArray" object:nil];
	
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	[[NSNotificationCenter defaultCenter]postNotificationName:@"deviceTokenReceived" object:nil];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveArray" object:nil];
	/*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

