//
//  MainViewController.m
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright Edward 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

- (void)dealloc {
  [super dealloc];
}

#pragma mark - UIViewController

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
  return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];	
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

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self.view resignFirstResponder];	// make main view the first responder
}

- (void)viewDidUnload {
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

#pragma mark - Public

- (IBAction)showInfo:(id)sender {    
  
  FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
  controller.delegate = self;
  
  controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentModalViewController:controller animated:YES];
  
  // set the sliders on the flipside to the current values in view
  MainView *view = (MainView *)self.view;
  [controller setColor:view.color lineWidth:view.lineWidth];
  [controller release];
}

#pragma mark - FlipsideViewControllerDelegate

- (void)setColor:(UIColor *)color{
  MainView *view = (MainView *)self.view;
  view.color = color;
}

- (void)setLineWidth:(float)width {
  MainView *view = (MainView *)self.view;
  [view setLineWidth:width];
  NSLog(@"Line width: %f", view.lineWidth);
}

- (void)resetView {
  MainView *view = (MainView *)self.view;
  [view resetView];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
  [self dismissModalViewControllerAnimated:YES];
}


@end
