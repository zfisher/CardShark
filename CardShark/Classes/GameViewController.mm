    //
//  GameViewController.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "GameViewController.h"
#import "GameModel.h"
#import "OptionsController.h"

GameViewController *masterGameViewController;

@implementation GameViewController
@synthesize currentGameModel;


+(GameViewController*)getMaster{
	if(!masterGameViewController){
		[[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
	}
	return masterGameViewController;
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		optionsController = [[OptionsController alloc] init];
		optionsController.delegate = self;
		
		optionsPopover = [[UIPopoverController alloc] initWithContentViewController:optionsController];
		
		optionsButton = [[UIButton alloc] init];
		optionsButton.layer.anchorPoint = CGPointMake(0.5, 0.5);
		optionsButton.frame = CGRectMake(self.view.frame.size.width/2.0-100, 15, 200, 30);
		optionsButton.titleLabel.textAlignment = UITextAlignmentCenter;
		[optionsButton setTitle:@"CardShark" forState:UIControlStateNormal];
		optionsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
		[self.view addSubview:optionsButton];
		[optionsButton addTarget:self action:@selector(showOptions) forControlEvents:UIControlEventTouchUpInside];
		
		masterGameViewController = self;
		
		
    }
    return self;
}

-(void)showOptions{
	[optionsPopover presentPopoverFromRect:optionsButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void)hideOptions{
	[optionsPopover dismissPopoverAnimated:YES];
}

-(void)setCurrentGameModel:(GameModel *)cgm{
	//printf("Game Model Set\n");
	[cgm retain];
	[currentGameModel release];
	currentGameModel = cgm;
	currentGameModel.delegate = self;
	//[optionsButton setTitle:[NSString stringWithFormat:@"CardShark\n%@", cgm.gameName] forState:UIControlStateNormal];
	
	//[self showOptions];
	
	[cgm initGame];
	
	
}	

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

-(void)startGame{
	[self hideOptions];
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
	[optionsController release];
	[optionsPopover release];
	[optionsButton release];
	[currentGameModel release];
    [super dealloc];
}


@end
