//
//  SettingsPopoverController.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "SettingsPopoverController.h"
#import "GameViewController.h"

#define WIDTH 400
#define HEIGHT 800

@implementation SettingsPopoverController
@synthesize numberOfPlayersSlider, delegate;

-(void)loadView{
	UIView *tempView = [[UIView alloc] init];
	self.view = tempView;
	[tempView release];
	self.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.3 blue:0.3 alpha:0.8];
	self.view.frame = CGRectMake(0,0, WIDTH, HEIGHT);
	
	float selfHalfWidth = self.view.frame.size.width/2.0;
	float selfHeight = self.view.frame.size.height;
	
	//returnButton returns, does not apply any changes
	returnButton = [[UIButton alloc] init];
	returnButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
	returnButton.frame = CGRectMake(selfHalfWidth - 150, selfHeight - 250, 80, 40);
	[returnButton setTitle:@"Return" forState:UIControlStateNormal];
	returnButton.titleLabel.textAlignment = UITextAlignmentCenter;
	returnButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
	[returnButton addTarget:delegate action:@selector(hideSettings) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:returnButton];
	
	
	//goButon will start the game/apply changes
	goButton = [[UIButton alloc] init];
	goButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
	goButton.frame = CGRectMake(selfHalfWidth + 110, selfHeight - 250, 80, 40);
	[goButton setTitle:@"Go" forState:UIControlStateNormal];
	goButton.titleLabel.textAlignment = UITextAlignmentCenter;
	goButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
	[goButton addTarget:delegate action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:goButton];
	
	//The slider determines how many players there are
	numberOfPlayersSlider = [[UISlider alloc] init];
	numberOfPlayersSlider.maximumValue = 10;
	numberOfPlayersSlider.minimumValue = 2;
	numberOfPlayersSlider.frame = CGRectMake(selfHalfWidth - 150, 100, 300, 30);
	[numberOfPlayersSlider addTarget:self action:@selector(updateNumberOfPlayersLabel) forControlEvents:UIControlEventTouchUpInside];
	[numberOfPlayersSlider addTarget:self action:@selector(updateNumberOfPlayersLabel) forControlEvents:UIControlEventTouchDragInside];
	[self.view addSubview:numberOfPlayersSlider];
	
	
	
	UILabel *sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfHalfWidth-150, 150, 300, 20)];
	[sliderLabel setText:@"Number of Players"];
	[self.view addSubview:sliderLabel];
	sliderLabel.backgroundColor = [UIColor clearColor];
	sliderLabel.textColor = [UIColor whiteColor];
	sliderLabel.textAlignment = UITextAlignmentCenter;
	[sliderLabel release];
	
	numberOfPlayersSliderNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfHalfWidth-150, 130, 300, 20)];
	[self.view addSubview:numberOfPlayersSliderNumberLabel];
	numberOfPlayersSliderNumberLabel.backgroundColor = [UIColor clearColor];
	numberOfPlayersSliderNumberLabel.textColor = [UIColor whiteColor];
	numberOfPlayersSliderNumberLabel.textAlignment = UITextAlignmentCenter;
}

-(void)updateNumberOfPlayersLabel{
	numberOfPlayersSliderNumberLabel.text = [NSString stringWithFormat:@"%d", (int)round(numberOfPlayersSlider.value)];
		
}

- (CGSize)contentSizeForViewInPopoverView {
    return CGSizeMake(WIDTH, HEIGHT);
}

-(void)dealloc{
	[numberOfPlayersSliderNumberLabel release];
	[returnButton release];
	[goButton release];
	[numberOfPlayersSlider release];
	[super dealloc];
}

@end
