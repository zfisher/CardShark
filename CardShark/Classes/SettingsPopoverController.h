//
//  SettingsPopoverController.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameViewController;

@interface SettingsPopoverController : UIViewController {
	UISlider *numberOfPlayersSlider;
	UILabel *numberOfPlayersSliderNumberLabel;
	UIButton *returnButton;
	UIButton *goButton;
	
	GameViewController *delegate;
	
}
-(void)updateNumberOfPlayersLabel;
@property (retain, nonatomic) GameViewController *delegate;
@property (readonly) UISlider *numberOfPlayersSlider;
@end
