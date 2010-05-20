//
//  CardSharkAppDelegate.h
//  CardShark
//
//  Created by Andrew Sugaya on 4/28/10.
//  Copyright Mythos 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class StartViewController;
@interface CardSharkAppDelegate : NSObject <UIApplicationDelegate> {
	
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
	
    UIWindow *window;
	
	StartViewController *startViewController;
}
@property (nonatomic,retain) IBOutlet StartViewController *startViewController;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (NSString *)applicationDocumentsDirectory;

@end

