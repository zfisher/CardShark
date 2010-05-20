//
//  StartRootViewController.h
//  CardShark
//
//  Created by Andrew Sugaya on 4/29/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StartDetailViewController;

@interface StartRootViewController : UITableViewController {
	StartDetailViewController *detailController;
	NSMutableArray *gameModels;
}

@property (nonatomic, retain) IBOutlet StartDetailViewController *detailController;
@end
