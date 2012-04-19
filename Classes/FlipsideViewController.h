//
//  FlipsideViewController.h
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright Edward 2010. All rights reserved.
//

/*
 Copyright (C) 2010 Edward Chiang
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	IBOutlet UISlider *redSlider;
	IBOutlet UISlider *greenSlider;
	IBOutlet UISlider *blueSlider;
	IBOutlet UISlider *widthSlider;
	IBOutlet UIView *colorView;
	BOOL clearScreen;
}

// declare delegate and outlets as properties
@property(nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property(nonatomic, retain) IBOutlet UISlider *redSlider;
@property(nonatomic, retain) IBOutlet UISlider *greenSlider;
@property(nonatomic, retain) IBOutlet UISlider *blueSlider;
@property(nonatomic, retain) IBOutlet UISlider *widthSlider; 
@property(nonatomic, retain) IBOutlet UIView *colorView; 

- (IBAction)done:(id)sender;
- (IBAction)updateColor:sender;
- (IBAction)erase:sender;
- (IBAction)clearScreen:sender;
- (void)setColor:(UIColor *)c lineWidth:(float)width;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
- (void)setColor:(UIColor *)color;
- (void)setLineWidth:(float)width;
- (void)resetView;
@end

