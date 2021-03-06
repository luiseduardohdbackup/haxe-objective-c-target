//
//  IntIterator
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "IntIterator.h"

@implementation IntIterator

@synthesize min;
@synthesize max;
- (BOOL) hasNext{
	return self.min < self.max;
}
- (int) next{
	return self.min++;
}
- (id) init:(int)min max:(int)max{
	self = [super init];
	self.min = min;
	self.max = max;
	return self;
}

@end
