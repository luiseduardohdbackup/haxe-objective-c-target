#import "Sys.h"

@implementation Sys

+ (void) print:(id)v{
	print(v);
}
+ (void) println:(id)v{
	[Sys print:v];
	[Sys print:@"\n"];
}
+ (Input*) stdin{
	return [[FileInput alloc] new:[file_stdin]];
}
+ (Output*) stdout{
	return [[FileOutput alloc] new:[file_stdout]];
}
+ (Output*) stderr{
	return [[FileOutput alloc] new:[file_stderr]];
}
+ (int) getChar:(BOOL)echo{
	return 0;
}
+ (NSMutabeArray*) args{
	return nil;
}
+ (NSMutableString*) getEnv:(NSMutableString*)s{
	
	NSMutableString *v = nil;
	if (v == nil) return nil;
	return v;
}
+ (void) putEnv:(NSMutableString*)s v:(NSMutableString*)v{
}
+ (void) sleep:(float)seconds{
}
+ (BOOL) setTimeLocale:(NSMutableString*)loc{
	return YES;
}
+ (NSMutableString*) getCwd{
	return nil;
}
+ (void) setCwd:(NSMutableString*)s{
}
+ (NSMutableString*) systemName{
	return nil;
}
+ (NSMutableString*) escapeArgument:(NSMutableString*)arg{
	BOOL ok = YES;
	{
		int _g1 = 0; int _g = arglength;
		while (_g1 < _g) {
			int i = _g1++;
			switch ([arg characterAtIndex:i]){
				case 32:case 34:{
					ok = NO}break;
				case 0:case 13:case 10:{
					arg = [arg substringWithRange:0 len:i]}break;
			}
		}
	}
	if (ok) return arg;
	return [[@"\"" stringByAppendingString:[[arg componentsSeparatedByString:@"\""].join:@"\\\""]] stringByAppendingString:@"\""];
}
+ (int) command:(NSMutableString*)cmd args:(NSMutabeArray*)args{
	if (args != nil) {
		cmd = [Sys escapeArgument:cmd];
		{
			int _g = 0;
			while (_g < args.length) {
				
				NSMutableString *a = [args objectAtIndex:_g];
				++_g;
				[cmd appendString:[@" " stringByAppendingString:[Sys escapeArgument:a]]];
			}
		}
	}
	return 0;
}
+ (void) exit:(int)code{
	exit(code);
}
+ (float) time{
	return 0;
}
+ (float) cpuTime{
	return 0;
}
+ (NSMutableString*) executablePath{
	return nil;
}
+ (Hash*) environment{
	
	NSMutabeArray *vars = nil;
	
	Hash *result = [[Hash alloc] new];
	int i = 0;
	while (i < vars.length) {
		[result set:[vars objectAtIndex:i] value:[vars objectAtIndex:i + 1]];
		i += 2;
	}
	return result;
}

@end
