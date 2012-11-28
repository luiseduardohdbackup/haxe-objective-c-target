
#import <Foundation/Foundation.h>

#import "Timer.h"
#import "Array.h"
#import "T.h"
#import "Log.h"
#import "Sys.h"

@interface Timer : NSObject

+ (Timer*) delay:(Function*)f time_ms:(int)time_ms;
+ (id) measure:(Function*)f pos:(id)pos;
+ (float) stamp;
@property (nonatomic, strong) NSTimer *nstimer;
@property (nonatomic) id id;
- (void) stop;
- (void) run;
- (id) new:(int)time_ms;

@end
