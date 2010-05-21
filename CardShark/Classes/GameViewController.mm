    //
//  GameViewController.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "GameViewController.h"
#import "GameModel.h"
#import "SettingsPopoverController.h"
@implementation GameViewController
@synthesize currentGameModel;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		settingsPopoverController = [[SettingsPopoverController alloc] init];
		settingsPopoverController.delegate = self;
		
		settingsPopover = [[UIPopoverController alloc] initWithContentViewController:settingsPopoverController];
		
		settingsButton = [[UIButton alloc] init];
		settingsButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
		settingsButton.frame = CGRectMake(self.view.frame.size.width/2.0-100, 15, 200, 30);
		settingsButton.titleLabel.textAlignment = UITextAlignmentCenter;
		[settingsButton setTitle:@"CardShark" forState:UIControlStateNormal];
		settingsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
		[self.view addSubview:settingsButton];
		[settingsButton addTarget:self action:@selector(showSettings) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		
    }
    return self;
}
-(void)showSettings{
	[settingsPopover presentPopoverFromRect:settingsButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
-(void)hideSettings{
	[settingsPopover dismissPopoverAnimated:YES];
}
-(void)setCurrentGameModel:(GameModel *)cgm{
	
	[cgm retain];
	[currentGameModel release];
	currentGameModel = cgm;
	settingsPopoverController.numberOfPlayersSlider.minimumValue = currentGameModel.minNumberOfPlayers;
	settingsPopoverController.numberOfPlayersSlider.maximumValue = currentGameModel.maxNumberOfPlayers;
	currentGameModel.delegate = self;
	[settingsPopoverController updateNumberOfPlayersLabel];
	[self showSettings];
	
}	

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

-(void)startGame{
	currentGameModel.numberOfPlayers = settingsPopoverController.numberOfPlayersSlider.value;
	[currentGameModel initGame];
	[self hideSettings];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[settingsPopover release];
	[settingsButton release];
	[currentGameModel release];
    [super dealloc];
}


@end
