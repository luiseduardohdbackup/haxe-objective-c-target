//
//  Timer
//  Test
//
//  Source generated by Haxe Objective-C target
//


#import <Foundation/Foundation.h>

#import "../haxe/Log.h"

@interface Timer : HXObject

@property (nonatomic, strong) NSTimer *nstimer;
@property (nonatomic) int _id;
- (void) stop;
// Defining a dynamic method
- (void) run;
@property (nonatomic,copy) void(^property_run)();
- (id) init:(int)time_ms;

@end
