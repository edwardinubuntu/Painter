//
//  MainView.h
//  Painter
//
//  Created by Edward Chiang on 2010/12/10.
//  Copyright 2010 Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Squiggle.h"

@interface MainView : UIView {
	NSMutableDictionary *squiggles;	// sguiggles in progress
	NSMutableArray *finishedSquiggles;	// finished squiggles
	UIColor *color;		// the current drawing color
	float lineWidth;	// the current drawing line width
}

// declare color and linewidth as properties
@property (nonatomic, retain) UIColor *color;
@property float lineWidth;

// draw the given Squiggle into the given graphics context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context;
- (void)resetView;	// clear all squiggles from the view


@end
