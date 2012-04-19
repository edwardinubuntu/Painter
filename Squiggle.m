//
//  Squiggle.m
//  Painter
//
//  Created by Edward Chiang on 2010/11/20.
//  Copyright 2010 Edward. All rights reserved.
//

#import "Squiggle.h"


@implementation Squiggle

// generate set and get methods
@synthesize strokeColor;
@synthesize lineWidth;
@synthesize points;

// initialize the Squiggle object
- (id)init {
  if (self = [super init]){
    points = [[NSMutableArray alloc]init];
    strokeColor = [[UIColor blackColor] retain];
  }
  return self;
}

// release Squiggle's memory
- (void) dealloc {
  [strokeColor release];
  [points release];
  [super dealloc];
}

#pragma mark - Public

- (void)addPoint:(CGPoint)point {
  // encode the point in an NSValue so we can put it in an NSArray
  NSValue *value = [NSValue valueWithBytes:&point objCType:@encode(CGPoint)];
  [points addObject:value];
}

@end
