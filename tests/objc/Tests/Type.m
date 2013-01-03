//
//  Type
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Type.h"

@implementation Type

+ (Class*) getSuperClass:(Class*)c{
	if (c == nil) return nil;
	return NSStringFromClass([c class]);
}
+ (NSMutableString*) getClassName:(Class*)c{
	if (c == nil) return nil;
	return NSStringFromClass([c class]);
}
+ (Class*) resolveClass:(NSMutableString*)name{
	
	Class *result = NSClassFromString ( name );
	return result;
}

@end
