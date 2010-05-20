//
//  CKCardView.h
//  CardKit
//
//  Created by Carter Allen on 3/28/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FontManager.h"
#import "ZAttributedString.h"
#import "FontLabelStringDrawing.h"
#import "CKCard.h"
#define CK_CARD_CORNER_RADIUS 3.0

@interface CKCardViewTextLayer : CALayer {}
@end

@interface CKCardView : UIView {
	CKCard *card;
	CAGradientLayer *backgroundGradientLayer;
	CKCardViewTextLayer *textLayer;
}
#pragma mark -
#pragma mark Properties
@property (nonatomic, retain) CKCard *card;
@property (nonatomic, readonly) CAGradientLayer *backgroundGradientLayer;
@property (nonatomic, readonly) CKCardViewTextLayer *textLayer;
#pragma mark -
#pragma mark Designated Initializer
- (id)initWithCard:(CKCard *)nCard frame:(CGRect)frame;
@end