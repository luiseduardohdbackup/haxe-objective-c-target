#import "Bytes.h"

@implementation Bytes

+ (Bytes*) alloc:(int)length{
	
	NSMutabeArray *a = [[NSMutabeArray alloc] new];
	{
		int _g = 0;
		while (_g < length) {
			int i = _g++;
			[a push:0];
		}
	}
	return [[Bytes alloc] new:length,a];
}
+ (Bytes*) ofString:(NSMutableString*)s{
	
	NSMutabeArray *a = [[NSMutabeArray alloc] new];
	{
		int _g1 = 0; int _g = slength;
		while (_g1 < _g) {
			int i = _g1++;
			int c = [scca "-dynamic_param-" ];
			if (c <= 127) [a push:c]
			else if (c <= 2047) {
				[a push:192 | c >> 6];
				[a push:128 | (c & 63)];
			}
			else if (c <= 65535) {
				[a push:224 | c >> 12];
				[a push:128 | (c >> 6 & 63)];
				[a push:128 | (c & 63)];
			}
			else {
				[a push:240 | c >> 18];
				[a push:128 | (c >> 12 & 63)];
				[a push:128 | (c >> 6 & 63)];
				[a push:128 | (c & 63)];
			}
		}
	}
	return [[Bytes alloc] new:a.length,a];
}
+ (Bytes*) ofData:(NSMutabeArray*)b{
	return [[Bytes alloc] new:b.length,b];
}
@synthesize length;
@synthesize b;
- (int) get:(int)pos{
	return [self.b objectAtIndex:pos];
}
- (void) set:(int)pos v:(int)v{
	[self.b objectAtIndex:pos] = (v & 255);
}
- (void) blit:(int)pos src:(Bytes*)src srcpos:(int)srcpos len:(int)len{
	if (pos < 0 || srcpos < 0 || len < 0 || pos + len > self.length || srcpos + len > src.length) throw Error.OutsideBounds;
	
	NSMutabeArray *b1 = self.b;
	
	NSMutabeArray *b2 = src.b;
	if (b1 == b2 && pos > srcpos) {
		int i = len;
		while (i > 0) {
			i--;
			[b1 objectAtIndex:i + pos] = [b2 objectAtIndex:i + srcpos];
		}
		return;
	}
	{
		int _g = 0;
		while (_g < len) {
			int i = _g++;
			[b1 objectAtIndex:i + pos] = [b2 objectAtIndex:i + srcpos];
		}
	}
}
- (Bytes*) sub:(int)pos len:(int)len{
	if (pos < 0 || len < 0 || pos + len > self.length) throw Error.OutsideBounds;
	return [[Bytes alloc] new:len,[self b slice:pos end:pos + len]];
}
- (int) compare:(Bytes*)other{
	
	NSMutabeArray *b1 = self.b;
	
	NSMutabeArray *b2 = other.b;
	int len = ( (self.length < other.length) ? self.length : other.length);
	{
		int _g = 0;
		while (_g < (int)len) {
			int i = _g++;
			if ([b1 objectAtIndex:i] != [b2 objectAtIndex:i]) return [b1 objectAtIndex:i] - [b2 objectAtIndex:i];
		}
	}
	return self.length - other.length;
}
- (NSMutableString*) readString:(int)pos len:(int)len{
	if (pos < 0 || len < 0 || pos + len > self.length) throw Error.OutsideBounds;
	
	NSMutableString *s = @"";
	
	NSMutabeArray *b = self.b;
	
	Function *fcc = @selector(fromCharCode);
	int i = pos;
	int max = pos + len;
	while (i < max) {
		int c = [b objectAtIndex:i++];
		if (c < 128) {
			if (c == 0) break;
			[s appendString:[fcc:c]];
		}
		else if (c < 224) [s appendString:[fcc: (c & @"63") << @"6" | ([b objectAtIndex:i++] & @"127")]]
		else if (c < 240) {
			int c2 = [b objectAtIndex:i++];
			[s appendString:[fcc:( (c & @"31") << @"12" |  (c2 & @"127") << @"6") | ([b objectAtIndex:i++] & @"127")]];
		}
		else {
			int c2 = [b objectAtIndex:i++];
			int c3 = [b objectAtIndex:i++];
			[s appendString:[fcc:(( (c & @"15") << @"18" |  (c2 & @"127") << @"12") | (c3 << @"6" & @"127")) | ([b objectAtIndex:i++] & @"127")]];
		}
	}
	return s;
}
- (NSMutableString*) toString{
	return [self readString:0 len:self length];
}
- (NSMutableString*) toHex{
	
	StringBuf *s = [[StringBuf alloc] new];
	
	NSMutabeArray *chars = [[NSMutableArray alloc] initWithObjects:, nil]];
	
	NSMutableString *str = @"0123456789abcdef";
	{
		int _g1 = 0; int _g = strlength;
		while (_g1 < _g) {
			int i = _g1++;
			[chars push:[str characterAtIndex:i]];
		}
	}
	{
		int _g1 = 0; int _g = self.length;
		while (_g1 < _g) {
			int i = _g1++;
			int c = [self.b objectAtIndex:i];
			{
				int c1 = [chars objectAtIndex:c >> 4];
				s.b += [NSMutableStringfromCharCode:c1];
			}
			{
				int c1 = [chars objectAtIndex:c & 15];
				s.b += [NSMutableStringfromCharCode:c1];
			}
		}
	}
	return s.b;
}
- (NSMutabeArray*) getData{
	return self.b;
}
- (id) new:(int)length b:(NSMutabeArray*)b{
	self = [super init];
	self.length = length;
	self.b = b;
	return self;
}

@end
