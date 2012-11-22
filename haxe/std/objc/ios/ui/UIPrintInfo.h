//
//  UIPrintInfo.h
package objc.ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIPrintInfoOutputType) {
    UIPrintInfoOutputGeneral,     // B&W or color, normal quality output for mixed text, graphics, and images
    UIPrintInfoOutputPhoto,       // B&W or color, best quality output for images
    UIPrintInfoOutputGrayscale,   // B&W content only
};

typedef NS_ENUM(NSInteger, UIPrintInfoOrientation) {
    UIPrintInfoOrientationPortrait,
    UIPrintInfoOrientationLandscape,
};

typedef NS_ENUM(NSInteger, UIPrintInfoDuplex) {
    UIPrintInfoDuplexNone,
    UIPrintInfoDuplexLongEdge,       // flip back page along long edge (same orientation in portrait, flipped for landscape)
    UIPrintInfoDuplexShortEdge,      // flip back page along short edge (flipped orientation for portrait, same in landscape)
};

NS_CLASS_AVAILABLE_IOS(4_2)extern class UIPrintInfo extends NSObject <NSCopying, NSCoding> { 
  @private
    NSString                *_printerID;
    NSString                *_jobName;
    UIPrintInfoOutputType    _outputType;
    UIPrintInfoOrientation   _orientation;
    UIPrintInfoDuplex        _duplex;
    NSInteger                _copies;
    BOOL                     _scaleUp;
}

+ (UIPrintInfo *)printInfo;
+ (UIPrintInfo *)printInfoWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

public var      NSString                *printerID;         // default is nil. set after user selects printer
public var      NSString                *jobName;           // default is application name
	public var           UIPrintInfoOutputType    outputType;        // default is UIPrintInfoOutputGeneral
	public var           UIPrintInfoOrientation   orientation;       // default is UIPrintInfoOrientationPortrait
	public var           UIPrintInfoDuplex        duplex;            // default is based on document type (none for photo, long edge for other)

}
