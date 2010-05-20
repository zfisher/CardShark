//
//  StartViewController.h
//  CardShark
//
//  Created by Andrew Sugaya on 4/29/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StartRootViewController, StartDetailViewController;
@interface StartViewController : UISplitViewController {
	StartRootViewController *rootController;
	StartDetailViewController *detailController;
}
@property (nonatomic,retain) IBOutlet StartRootViewController *rootController;
@property (nonatomic,retain) IBOutlet StartDetailViewController *detailController;

@end
