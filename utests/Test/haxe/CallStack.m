//
//  CallStack
//  Test
//
//  Source generated by Haxe Objective-C target
//

#import "../haxe/CallStack.h"

@implementation CallStack

+ (NSMutableArray*) exceptionStack{
	return [[NSMutableArray alloc] initWithObjects:, nil];
}
+ (NSMutableString*) toString:(NSMutableArray*)stack{
	
	StringBuf *b = [[StringBuf alloc] init];
	{
		int _g = 0;
		while (_g < stack.length) {
			
			CallStack *s = [stack objectAtIndex:_g];
			++_g;
			[b.b appendString:(NSMutableString*)@"\nCalled from "];
			[CallStack itemToString:b s:s];
		}
	}
	return b.b;
}
+ (void) itemToString:(StringBuf*)b s:(CallStack*)s{
	
	var $e : enum =  (s)
	switch ( $e.index ) {
		
		case 0:
		{
			[b.b appendString:(NSMutableString*)@"a C function"]}break
		case 1:
		
		var MATCH s_eModule_0 : NSMutableString = $e.params[0]{
			{
				[b.b appendString:(NSMutableString*)@"module "];
				b.b += [Std string:s_eModule_0];
			}}break
		case 2:
		
		var MATCH s_eFilePos_2 : int = $e.params[2], MATCH s_eFilePos_1 : NSMutableString = $e.params[1], MATCH s_eFilePos_0 : CallStack = $e.params[0]{
			{
				if (s_eFilePos_0 != nil) {
					[CallStack itemToString:b s:s_eFilePos_0];
					[b.b appendString:(NSMutableString*)@" ("];
				}
				b.b += [Std string:s_eFilePos_1];
				[b.b appendString:(NSMutableString*)@" line "];
				b.b += [Std string:s_eFilePos_2];
				if (s_eFilePos_0 != nil) [b.b appendString:(NSMutableString*)@")"];
			}}break
		case 3:
		
		var MATCH s_eMethod_1 : NSMutableString = $e.params[1], MATCH s_eMethod_0 : NSMutableString = $e.params[0]{
			{
				b.b += [Std string:s_eMethod_0];
				[b.b appendString:(NSMutableString*)@"."];
				b.b += [Std string:s_eMethod_1];
			}}break
		case 4:
		
		var MATCH s_eLambda_0 : int = $e.params[0]{
			{
				[b.b appendString:(NSMutableString*)@"local function #"];
				b.b += [Std string:s_eLambda_0];
			}}break
	}
}

@end
