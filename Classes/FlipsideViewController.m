//
//  FlipsideViewController.m
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright Edward 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@implementation FlipsideViewController

@synthesize delegate;
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize widthSlider;
@synthesize colorView;

- (void)viewDidLoad {
    // [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      
}

// called when view is going to be displayed
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	clearScreen = NO;
}

// set the values for color and lineWidth
- (void)setColor:(UIColor *)c lineWidth:(float)width	{
	// split the passed color into its RGB compoments
	const float *colors = CGColorGetComponents(c.CGColor);
	
	// update the sliders with the new value
	redSlider.value = colors[0]; // set the red slider's value
	greenSlider.value = colors[1];
	blueSlider.value = colors[2];
	
	// update the color of colorView to reflect
	colorView.backgroundColor = c;
	
	// update the width slider
	widthSlider.value = width;
}

- (IBAction)done:(id)sender {
	// set the new values for color and line width
	[(MainViewController *)self.delegate setColor:colorView.backgroundColor];
	[(MainViewController *)self.delegate setLineWidth:widthSlider.value];
	if (clearScreen) {
		[(MainViewController *)self.delegate resetView];
	}
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (IBAction)clearScreen:sender {
	clearScreen = YES;
}

- (IBAction)erase:sender {
	// do all the changes in an animation block so all the sliders finish 
	// moving at the same time 
	[UIView beginAnimations:nil context:nil]; // begin animation block 
	[UIView setAnimationDuration:0.5]; // set the animation length
	
	// set all sliders to their max value so the color is white 
	[redSlider setValue:1.0]; // set the red slider’s value to 1 
	[greenSlider setValue:1.0]; // set the green slider’s value to 1 
	[blueSlider setValue:1.0]; // set the blue slider’s value to 1

	// update colorView to reflect the new slider values
	[colorView setBackgroundColor:[UIColor whiteColor]];
	[UIView commitAnimations]; // end animation block // end method erase
}
	
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
	[redSlider release];
	[greenSlider release];
	[blueSlider release];
	[colorView release];
    [super dealloc];
}

- (IBAction)updateColor:sender {
	UIColor *color = [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1.0];
	[colorView setBackgroundColor:color];
}

@end
