//
//  GameViewController.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//
//This class is a ViewController for the games.
//It will create and modify subviews within its own view depending on 
//the game model.
//Views will notify this controller when they are modified/moved/etc

#import <UIKit/UIKit.h>
@class GameModel;
@class OptionsController;
@interface GameViewController : UIViewController <UIPopoverControllerDelegate>  {
	GameModel *currentGameModel;
	
	UIPopoverController *optionsPopover;
	OptionsController *optionsController;
	//SettingsPopoverController *settingsPopoverController;
	UIButton *optionsButton;
	
}
+(GameViewController*)getMaster;
-(void)showOptions;
-(void)hideOptions;
-(void)startGame;

@property (retain, nonatomic) GameModel *currentGameModel;

@end
