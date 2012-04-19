//
//  MainView.h
//  Painter
//
//  Created by Edward Chiang on 2010/12/10.
//  Copyright 2010 Edward in Action. All rights reserved.
//

/*
 Copyright (C) 2010 Edward Chiang
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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
