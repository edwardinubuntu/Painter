//
//  MainViewController.m
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright GSS 2010. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize color;
@synthesize lineWidth;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	// initialize squiggles and finishedSquiggles
	squiggles = [[NSMutableDictionary alloc] init];
	finishedSquiggles = [[NSMutableArray alloc] init];
	// the starting color is black
	color = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
	lineWidth = 5;
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	// set the sliders on the flipside to the current values in view
	[controller setColor:color lineWidth:lineWidth];
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self becomeFirstResponder];	// make main view the first responder
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

// clear the paintings in main view
- (void)resetView {
	[squiggles removeAllObjects];
	[finishedSquiggles removeAllObjects];
	[self.view setNeedsDisplay];	// refresh the display
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	for (Squiggle *squiggle in finishedSquiggles)
		[self drawSquiggle:squiggle inContext:context];
	
	for (NSString *key in squiggles) {
		Squiggle *squiggle = [squiggles valueForKey:key];
		[self drawSquiggle:squiggle inContext:context];
	}
}

// draws the given squiggle into the given context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context {
	// set the drawing color to the squiggle's color
	UIColor *squiggleColor = squiggle.strokeColor;
	CGColorRef	colorRef = [squiggleColor CGColor];	// get the CGColor
	CGContextSetStrokeColorWithColor(context, colorRef);
	
	// set the line width to the squiggle's line width
	CGContextSetLineWidth(context, squiggle.lineWidth);
	
	NSMutableArray *points = [ squiggle points];	// get points from squiggle
	
	// retrieve the NSValue object and store the value in firstPoint
	CGPoint firstPoint;	// declare a CGPoint
	[[points objectAtIndex:0] getValue:&firstPoint];
	
	// move to the point
	CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
	
	// draw a line from each point to the next in order
	for (int i=1; i < [points count]; i++) {
		NSValue *value = [points objectAtIndex:i];
		CGPoint point;	// declare a new point
		[value getValue:&point];	// store the value in point
		
		// draw a line to the new point
		CGContextAddLineToPoint(context, point.x, point.y);
		
	} // end for
	
	CGContextStrokePath(context);
	UIGraphicsPushContext(context);
}

// called whenever the user places a finger on the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *array = [ touches allObjects];	// get all the new touches
	
	// loop through each new touch
	for (UITouch *touch in array ) {
		// create and configure a new squiggle
		Squiggle *squiggle = [[Squiggle alloc] init];
		[squiggle setStrokeColor:color];	// set squiggle's stroke color
		[squiggle setLineWidth:lineWidth];	// set squiggle's line width
		
		// add the location of the first touch to the squiggle
		//[squiggle addPoint:[touch locationInView:self]];
		
		// the key for each touch is the value of the pointer
		NSValue *touchValue = [NSValue valueWithPointer:touch];
		NSString *key = [NSString stringWithFormat:@"%@", touchValue];
		
		// add the new touch to the dictionary under a unique key
		[squiggles setValue:squiggle forKey:key];
		[squiggle release];	// we are done with squiggle so release it	 
	}	// end for
}

// called whenever the user drags a finger on the screen
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *array = [touches allObjects];	// get all the moved touches
	
	// loop through all the touches
	for (UITouch *touch in array) {
		// get the unique key for this touch
		NSValue * touchValue = [NSValue valueWithPointer:touch];
		
		// fetch the squiggle this touch should be added to using the key
		Squiggle *squiggle = [squiggles valueForKey:[NSString stringWithFormat:@"%@", touchValue]];
		
		// get the current and previous touch locations
		CGPoint current = [touch locationInView:self.view];
		CGPoint previous = [touch previousLocationInView:self.view];
		[squiggle addPoint:current];	// add the new point to the squiggle
		
		// screen needs to be redrawn
		CGPoint lower, higher;
		lower.x = (previous.x > current.x ? current.x : previous.x);
		lower.y	= (previous.y > current.y ? current.y: previous.y);
		higher.x = (previous.x < current.x ? current.x : previous.x);
		higher.y = (previous.y < current.y ? current.y: previous.y);
		
		// redraw the screen in the required region
		[self drawRect:CGRectMake(lower.x - lineWidth,
											   lower.y - lineWidth, higher.x - lower.x + lineWidth * 2, 
											   higher.y - lower.y + lineWidth * 2)];
	}	// end for
}

// called when the user lefts a finger from the screen
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	// loop through the touches
	for (UITouch *touch in touches) {
		// get the unique key for the touch
		NSValue *touchValue = [NSValue valueWithPointer:touch];
		NSString *key = [NSString stringWithFormat:@"%@", touchValue];
		// retrieve the squiggle for this touch using the key
		Squiggle *squiggle = [squiggles valueForKey:key];
		// remove the squiggle from the dictionary and place it in an array // of finished squiggles [finishedSquiggles addObject:squiggle]; // add to finishedSquiggles [squiggles removeObjectForKey:key]; // remove from squiggles
		[finishedSquiggles addObject:squiggle]; // add to finishedSquiggles 
		[squiggles removeObjectForKey:key]; // remove from squiggles
	}//endfor
}

// called when a motion event, such as a shake, ends
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	// if a shake event ended
	if (event.subtype == UIEventSubtypeMotionShake){
		// create an alert prompting the user about clearing the painting
		NSString *message = @"Are you sure you want to clear the painting?";
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Clear painting" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"clear", nil];
		[alert show];
		[alert release];
	}// end if
	[super motionEnded:motion withEvent:event];
} // end method

// clear the painting if the user touched the "Clear" button
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	// if the user touched the Clear button
	if (buttonIndex ==1 )
		[self resetView];	// clear the screen
}

// determines if this view can become the first responder
- (BOOL)canBecomeFirstResponder { 
	return YES;
}

- (void)dealloc {
	[squiggles release]; // release the squiggles NSMutableDictionary 
	[finishedSquiggles release]; // release finishedSquiggles 
	[color release]; // release the color UIColor 
    [super dealloc];
}


@end
