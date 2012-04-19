//
//  Squiggle.h
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright 2010 Edward. All rights reserved.
//

/*
 Copyright (C) 2010 Edward Chiang
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foundation/Foundation.h>


@interface Squiggle : NSObject {
  
  NSMutableArray *points;	// the points that make up the Squiggle
  UIColor *strokeColor;	// the color of this Squiggle
  float lineWidth;	//	the line width for this Squiggle
  
  // end instance variable declartion
}

// declare strokeColor, lineWidth and points as properties
@property (retain) UIColor* strokeColor;
@property (assign) float lineWidth;
@property (nonatomic, readonly) NSMutableArray *points;

- (void)addPoint:(CGPoint)point;	// adds a new point to the Suiggle
@end
