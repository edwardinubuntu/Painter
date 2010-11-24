//
//  FlipsideViewController.h
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright GSS 2010. All rights reserved.
//

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

