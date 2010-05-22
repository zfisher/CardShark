//
//  StartDetailViewController.h
//  CardShark
//
//  Created by Andrew Sugaya on 4/29/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameViewController;

@interface StartDetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
    UIPopoverController *popoverController;
    UINavigationBar *navigationBar;
    
    id detailItem;
	
	GameViewController *gameController;
}
-(void)startGame;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet GameViewController *gameController;
@property (nonatomic, retain) id detailItem;

@end
