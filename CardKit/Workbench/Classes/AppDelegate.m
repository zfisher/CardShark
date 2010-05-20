//
//  AppDelegate.m
//  CardKit
//
//  Created by Carter Allen on 4/2/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window, viewController;
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
	[CKDeck standardDeck];
}
- (void)dealloc {
	[viewController release];
	[window release];
	[super dealloc];
}
@end