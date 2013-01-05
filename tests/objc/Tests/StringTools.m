//
//  StringTools
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "StringTools.h"

@implementation StringTools

+ (NSMutableString*) urlEncode:(NSMutableString*)s{
	return [s stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
+ (NSMutableString*) urlDecode:(NSMutableString*)s{
	return [s stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
+ (NSMutableString*) htmlEscape:(NSMutableString*)s quotes:(BOOL)quotes{
	// Simulated optional arguments
	if (quotes == nil) quotes = nil;
	
	s = [[[[[[s componentsSeparatedByString:(NSMutableString*)@"&"] join:(NSMutableString*)@"&amp;"] componentsSeparatedByString:(NSMutableString*)@"<"] join:(NSMutableString*)@"&lt;"] componentsSeparatedByString:(NSMutableString*)@">"] join:(NSMutableString*)@"&gt;"];
	return ( (quotes) ? [[[[s componentsSeparatedByString:(NSMutableString*)@"\""] join:(NSMutableString*)@"&quot;"] componentsSeparatedByString:(NSMutableString*)@"'"] join:(NSMutableString*)@"&#039;"] : s);
}
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s{
	return [[[[[[[[[[s componentsSeparatedByString:(NSMutableString*)@"&gt;"] join:(NSMutableString*)@">"] componentsSeparatedByString:(NSMutableString*)@"&lt;"] join:(NSMutableString*)@"<"] componentsSeparatedByString:(NSMutableString*)@"&quot;"] join:(NSMutableString*)@"\""] componentsSeparatedByString:(NSMutableString*)@"&#039;"] join:(NSMutableString*)@"'"] componentsSeparatedByString:(NSMutableString*)@"&amp;"] join:(NSMutableString*)@"&"];
}
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start{
	return s.length >= start.length && [s substr:0 len:start.length] == start;
}
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end{
	int elen = end.length;
	int slen = s.length;
	return slen >= elen && [s substr:slen - elen len:elen] == end;
}
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos{
	int c = [s characterAtIndex:pos];
	return c >= 9 && c <= 13 || c == 32;
}
+ (NSMutableString*) ltrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:r]) r++;
	if (r > 0) return [s substr:r len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) rtrim:(NSMutableString*)s{
	int l = s.length;
	int r = 0;
	while (r < l && [StringTools isSpace:s pos:l - r - 1]) r++;
	if (r > 0) return [s substr:0 len:l - r];
	else return s;
	return nil;
}
+ (NSMutableString*) trim:(NSMutableString*)s{
	return [StringTools ltrim:[StringTools rtrim:s]];
}
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	if (c.length <= 0) return s;
	while (s.length < l) s = c + s;
	return s;
}
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l{
	if (c.length <= 0) return s;
	while (s.length < l) s = s + c;
	return s;
}
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by{
	return [s replaceOccurrencesOfString:sub withString:by options:nil range:nil];
}
+ (NSMutableString*) hex:(int)n digits:(int)digits{
	// Simulated optional arguments
	if (digits == nil) digits = nil;
	
	
	NSMutableString *s = (NSMutableString*)@"";
	
	NSMutableString *hexChars = (NSMutableString*)@"0123456789ABCDEF";
	do {
		s = [[hexChars characterAtIndex:n & @"15"] stringByAppendingString:s];
		n >>>= 4;
	}while (n > 0);
	if (digits != nil) while (s.length < digits) s = [(NSMutableString*)@"0" stringByAppendingString:s];
	return s;
}
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index{
	return [s cca:index];
}
+ (BOOL) isEof:(int)c{
	return c == -1;
}

@end
