//
//  Resource
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Resource.h"

@implementation Resource

+ (id) __meta__:(id)val {
	static id _val;
	if (val == nil) { if (_val == nil) _val = struct {
obj:struct {
core_api:nil
} structName
} structName; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableDictionary*) __plist__:(NSMutableDictionary*)val {
	static NSMutableDictionary *_val;
	if (val == nil) { if (_val == nil) _val = [[NSMutableDictionary alloc] init]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (NSMutableArray*) listNames{
	return [Resource __plist__ allKeys];
}
+ (NSMutableString*) getString:(NSMutableString*)name{
	return [Resource __plist__ objectForKey:name];
}
+ (Bytes*) getBytes:(NSMutableString*)name{
	
	NSMutableArray *array = (NSMutableArray*)[Resource __plist__ __hxcpp_resource_bytes-TDynamic-];
	if (array == nil) return nil;
	return [Bytes ofData:array];
}

@end