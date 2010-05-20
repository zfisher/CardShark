//
//  AppDelegate.h
//  CardKit
//
//  Created by Carter Allen on 4/2/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardKit.h"

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet UIViewController *viewController;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;
@end