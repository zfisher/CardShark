//
//  CKCardView.m
//  CardKit
//
//  Created by Carter Allen on 3/28/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import "CKCardView.h"

@implementation CKCardView
#pragma mark -
#pragma mark Properties
@synthesize card;
#pragma mark -
#pragma mark Designated Initializer
- (id)initWithCard:(CKCard *)nCard frame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) self.card = nCard;
	return self;
}
- (void)awakeFromNib {
	[self.layer addSublayer:self.backgroundGradientLayer];
	[self.layer addSublayer:self.textLayer];
}
#pragma mark -
#pragma mark CoreAnimation Layers
- (CAGradientLayer *)backgroundGradientLayer {
	if (!backgroundGradientLayer) {
		backgroundGradientLayer = [CAGradientLayer layer];
		backgroundGradientLayer.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
		backgroundGradientLayer.cornerRadius = CK_CARD_CORNER_RADIUS;
		[backgroundGradientLayer setNeedsDisplay];
		/*backgroundGradientLayer.shadowColor = [[UIColor blackColor] CGColor];
		backgroundGradientLayer.shadowRadius = 1.0f;
		backgroundGradientLayer.shadowOffset = CGSizeMake(0.0f, 1.0f);
		backgroundGradientLayer.shadowOpacity = 0.75f;*/
		CGFloat backgroundStartComponents[4] = { 1.000, 1.000, 1.000, 1.000 };
		CGColorRef backgroundStart = CGColorCreate(CGColorSpaceCreateDeviceRGB(), backgroundStartComponents);
		CGFloat backgroundEndComponents[4] = { 0.902, 0.903, 0.902, 1.000 };
		CGColorRef backgroundEnd = CGColorCreate(CGColorSpaceCreateDeviceRGB(), backgroundEndComponents);
		[backgroundGradientLayer setColors:[NSArray arrayWithObjects:(id)backgroundStart, (id)backgroundEnd, nil]];
		CGColorRelease(backgroundStart);
		CGColorRelease(backgroundEnd);
	}
	return backgroundGradientLayer;
}
- (CKCardViewTextLayer *)textLayer {
	if (!textLayer) {
		textLayer = [CKCardViewTextLayer layer];
		textLayer.frame = CGRectMake(self.frame.size.width/4, self.frame.size.height/4, self.frame.size.width/2, self.frame.size.height/2);
		textLayer.borderWidth = 1.0f;
		textLayer.borderColor = [[UIColor redColor] CGColor];
		[textLayer setNeedsDisplay];
	}
	return [textLayer retain];
}
#pragma mark -
#pragma mark Other
- (void)dealloc {
	if (backgroundGradientLayer) [backgroundGradientLayer release];
	if (textLayer) [textLayer release];
    [super dealloc];
}
@end

#pragma mark -
@implementation CKCardViewTextLayer
- (void)drawInContext:(CGContextRef)context {
	CGContextSetFillColorWithColor(context, [[UIColor darkTextColor] CGColor]);
	UIGraphicsPushContext(context);	
	ZAttributedString *title = [[ZAttributedString alloc] initWithString:@"A" attributes:[NSDictionary dictionaryWithObjectsAndKeys:[[FontManager sharedManager] zFontWithURL:[NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/CardKit.bundle/CardKit.ttf"]] pointSize:20], ZFontAttributeName, nil]];
	[title drawInRect:self.frame];
	[title release];
	UIGraphicsPopContext();
}
@end