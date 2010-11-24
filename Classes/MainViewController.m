//
//  MainViewController.m
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright GSS 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	// set the sliders on the flipside to the current values in view
	// MainView *view = (MainView *)self.view; 
	// [controller setColor:view.color lineWidth:view.lineWidth];
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.view becomeFirstResponder];	// make main view the first responder
} // end method

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

// set the color of the main view
- (void)setColor:(UIColor *)color {
	MainView *view = (MainView *)self.view;	//get main view as MainView
	view.color = color;	// update the color in the main view
}

// set the line width of the main view
- (void)setLineWidth:(float)width {
	MainView *view = (MainView *)self.view; // get main view as a MainView
	view.lineWidth = width; // update the line width in the main view 
}

// clear the paintings in main view
- (void)resetView {
	MainView *view = (MainView *)self.view;
	[view resetView];
}

- (void)dealloc {
    [super dealloc];
}


@end
