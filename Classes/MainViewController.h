//
//  MainViewController.h
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright GSS 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "Squiggle.h";

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	NSMutableDictionary *squiggles;	// sguiggles in progress
	NSMutableArray *finishedSquiggles;	// finished squiggles
	float lineWidth;	// the current drawing line width
}

// declare color and linewidth as properties
@property (nonatomic, retain) UIColor *color;
@property float lineWidth;

// draw the given Squiggle into the given graphics context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context;
- (void)resetView;	// clear all squiggles from the view

- (IBAction)showInfo:(id)sender;


@end
