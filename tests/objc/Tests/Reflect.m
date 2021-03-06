//
//  Reflect
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Reflect.h"

@implementation Reflect

+ (BOOL) hasField:(id)o field:(NSMutableString*)field{
	return o != nil && [o __HasField-TDynamic-];
}
+ (id) field:(id)o field:(NSMutableString*)field{
	return ( (o == nil) ? nil : [o __Field-TDynamic-]);
}
+ (void) setField:(id)o field:(NSMutableString*)field value:(id)value{
	if (o != nil) [o __SetField-TDynamic-];
}
+ (id) getProperty:(id)o field:(NSMutableString*)field{
	return ( (o == nil) ? nil : [o __Field-TDynamic-]);
}
+ (void) setProperty:(id)o field:(NSMutableString*)field value:(id)value{
	if (o != nil) [o __SetField-TDynamic-];
}
+ (id) callMethod:(id)o func:(id)func args:(NSMutableArray*)args{
	if (func != nil && [func __GetType] == __global__ vtString) func = [o __Field-TDynamic-];
	[func __SetThis-TDynamic-];
	return [func performSelector-TDynamic-];
}
+ (NSMutableArray*) fields:(id)o{
	if (o == nil) return [[NSMutableArray alloc] init];
	
	NSMutableArray *a = [[NSMutableArray alloc] initWithObjects:, nil];
	[o __GetFields-TDynamic-];
	return a;
}
+ (BOOL) isFunction:(id)f{
	return f != nil && [f __GetType] == __global__ vtFunction;
}
+ (int) compare:(id)a b:(id)b{
	return ( (a == b) ? 0 : ( ((int)a > (int)b) ? 1 : -1));
}
+ (BOOL) compareMethods:(id)f1 f2:(id)f2{
	if (f1 == f2) return YES;
	if (![Reflect isFunction:f1] || ![Reflect isFunction:f2]) return NO;
	return [__global__ __hxcpp_same_closure:f1 :f2];
}
+ (BOOL) isObject:(id)v{
	if (v == nil) return NO;
	int t = [v __GetType];
	return t == __global__ vtObject || t == __global__ vtClass || t == __global__ vtString || t == __global__ vtArray;
}
+ (BOOL) deleteField:(id)o f:(NSMutableString*)f{
	if (o == nil) return NO;
	return [__global__ __hxcpp_anon_remove:o :f];
}
+ (id) copy:(id)o{
	if (o == nil) return nil;
	if ([o __GetType] == __global__ vtString) return o;
	if ([o __GetType] == __global__ vtArray) return [[o __Field:(NSMutableString*)@"copy" :YES]];
	id o2 = struct {
	
	} structName;
	{
		int _g = 0; 
		NSMutableArray *_g1 = (NSMutableArray*)[Reflect fields:o];
		while (_g < _g1.length) {
			
			NSMutableString *f = [_g1 objectAtIndex:_g];
			++_g;
			if (o2 != nil) [o2 __SetField-TDynamic-];
		}
	}
	return o2;
}
+ (id) makeVarArgs:(SEL)f{
	return [__global__ __hxcpp_create_var_args:f];
}

@end
