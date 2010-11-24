//
//  MainView.h
//  Painter
//
//  Created by Edward Chiang on 2010/11/24.
//  Copyright 2010 GSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Squiggle.h";

@interface MainView : UIView {
	NSMutableDictionary *squiggles;	// sguiggles in progress
	NSMutableArray *finishedSquiggles;	// finished squiggles
	float lineWidth;	// the current drawing line width
}	// end instance variable declaration

// declare color and linewidth as properties
@property (nonatomic, retain) UIColor *color;
@property float lineWidth;

// draw the given Squiggle into the given graphics context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context;
- (void)resetView;	// clear all squiggles from the view

@end
