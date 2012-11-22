//
//  UIRotationGestureRecognizer.h
package objc.ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIGestureRecognizer.h>

// Begins:  when two touches have moved enough to be considered a rotation
// Changes: when a finger moves while two fingers are down
// Ends:    when both fingers have lifted

extern class UIRotationGestureRecognizer : UIGestureRecognizer {
  @package
    double            _initialTouchDistance;
    double            _initialTouchAngle;
    double            _currentTouchAngle;
    NSInteger         _currentRotationCount;
    NSTimeInterval    _lastTouchTime;
    CGFloat           _velocity;
    CGFloat           _previousVelocity;
    CGPoint           _anchorPoint;
    id                _transformAnalyzer;
    UITouch          *_touches[2];
}

	public var          CGFloat rotation;            // rotation in radians
	public var  (nonatomic,readonly) CGFloat velocity;            // velocity of the pinch in radians/second

}
