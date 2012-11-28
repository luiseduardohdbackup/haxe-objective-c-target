#import "Tests.h"

@implementation Tests

+ (NSMutableString*) staticVar1:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val = @"abcd"; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar2:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) staticVar3:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val = 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}

@synthesize interfaceVar1;
@synthesize interfaceVar2;

@synthesize d1;
@synthesize d2;
@synthesize s;
- (void) testVariables{
	
	NSMutabeArray *a = [[NSMutabeArray alloc] new];
	int b = 5;
	float c = 5.0;
	
	NSMutableString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int)5.3;
	id g1 = (id)6.3;
	id g2 = (id)a;
	int xy = a.length;
	[a push:@"6"];
	if (a.length > 3) f = 3
	else f = a.length;
	f = ( (a.length > 3) ? 3 : a.length);
	int x = [[[Tests alloc] new] add:1 b:1];
	[Lib isIpad];
}
- (void) testingFor{
	
	NSMutabeArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
	{
		int _g = 0;
		while (_g < 5) {
			int i = _g++;
			[aa push:i];
		}
	}
	{
		int _g1 = 0; int _g = aa.length;
		while (_g1 < _g) {
			int i = _g1++;
			[aa push:i];
		}
	}
	{
		int _g = 0;
		while (_g < aa.length) {
			int i = [aa objectAtIndex:_g];
			++_g;
			[aa push:i];
		}
	}
}
- (void) testWhile{
	int aa = 5;
	do {
		[Log trace:@"something" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"73",@"Tests",@"testWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		aa++;
	}while (aa < 10);
}
- (void) testTry{
	@try {
		int a = 3;
	}
	@catch (NSException *e) {
		[Log trace:@"error" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"86",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
}
- (void) testSwitch{
	switch (YES){
		case YES:{
			{
				int x = 0;
			}}break;
		case NO:{
			{
				int y = 0;
			}}break;
	}
}
- (void) testArray{
	
	NSMutabeArray *as = [[NSMutabeArray alloc] new];
	
	NSMutabeArray *aa = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil]];
	float aaa = [aa objectAtIndex:2];
	[aa objectAtIndex:3];
}
- (void) testDate{
	
	NSDate *d = [[NSDate alloc] new:2012,11,13,19,30,0];
	
	NSDate *d2 = [NSDatenow];
	int x = [DateTools getMonthDays:d2];
}
- (void) testEnum{
}
- (void) testEReg{
}
- (void) testHash{
	
	Hash *h = [[Hash alloc] new];
	[h set:@"key" value:@"value"];
	[h get:@"key"];
	[h remove:@"key"];
	BOOL b = [h exists:@"key"];
	id arr = [h keys];
	id iter = [h iterator];
	
	NSMutableString *str = [h toString];
	
	IntHash *hi = [[IntHash alloc] new];
	[hi set:0 value:@"value"];
	[hi get:0];
	[hi remove:0];
	BOOL bi = [hi exists:0];
	id arri = [hi keys];
	id iteri = [hi iterator];
	
	NSMutableString *stri = [hi toString];
}
- (void) testLambda{
}
- (void) testList{
}
- (void) testMath{
	float pi = M_PI;
	float max = -DBL_MAX;
	float min = DBL_MAX;
	float nan = NaN;
	float x = sqrtf(5);
	x = absf(5);
	x = fmaxf(5, 45555);
	x = fminf(5, 45555);
	x = sinf(5);
	x = cosf(5);
	x = atan2f(5, 3);
	x = tanf(5);
	x = expf(5);
	x = logf(5);
	x = sqrtf(5);
	int xr = roundf(5);
	xr = floorf(5);
	xr = ceilf(5);
	x = atanf(5);
	x = asinf(5);
	x = acosf(5);
	x = powf(5, 4);
	x = rand() * 5;
	BOOL b = isfinite(45454);
	b = isnan(45454);
	float j = x + xr;
	j += x;
	float k = ( (b) ? -x : x);
}
- (void) testReflect{
	id obj = struct {
	a:@"aaaaa"} structName;
	BOOL b = [Reflect hasField:obj field:@"a"];
	id f = [Reflect field:obj field:@"a"];
	if (obj != nil) [obj GFA2 .__SetField "-dynamic_param-" ];
	[self __SetField "-dynamic_param-" ];
	id p = (id)[self __Field "-dynamic_param-" ];
	[Reflect callMethod:self func:@selector(testStd) args:[[NSMutableArray alloc] initWithObjects:, nil]]];
	[Reflect callMethod:self func:@selector(callLotsOfArguments) args:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil]]];
	
	NSMutabeArray *fs = [Reflect fields:obj];
	BOOL isf = [Reflect isFunction:@selector(testStd)];
	int i = [Reflect compare:1 b:2];
	BOOL cm = [Reflect compareMethods:@selector(testStd) f2:@selector(testString)];
	BOOL isobj = [Reflect isObject:obj];
	isobj = [Reflect isObject:@selector(testStd)];
	[Reflect deleteField:obj f:@"a"];
	id obj2 = [Reflect copy:obj];
}
- (void) testStd{
}
- (void) testString{
	
	NSMutableString *string = [[NSMutableString alloc] new:@"abcdefghijklmnopqrstuvwxyz"];
	int len = stringlength;
	
	NSMutableString *s = [string characterAtIndex:5];
	id ch = [string characterAtIndex:5];
	int i = [string rangeOfString:@"abc" startIndex:nil];
	int i1 = [string rangeOfString:@"abc" startIndex:2];
	int li = [string rangeOfString options:NSBackwardsSearch:@"abc" startIndex:nil];
	
	NSMutabeArray *components = [string componentsSeparatedByString:@"-"];
	
	NSMutableString *s2 = [string substringWithRange:5 len:nil];
	s2 = [string substringWithRange:5 len:len];
	s2 = [string substringWithRange:5 endIndex:nil];
	s2 = [string substringWithRange:1 endIndex:len];
	s2 = [string lowercaseString];
	s2 = [string uppercaseString];
	s2 = [string description];
	
	NSMutableString *s3 = @"\t";
	
	StringBuf *buf = [[StringBuf alloc] new];
	[buf.b appendString:@"abc"];
	[buf.b appendString:@""];
	buf.b += [@"abcdefghijklmnopqerstuvwxyz" substringWithRange:5 len:nil];
	buf.b += [@"abcdefghijklmnopqerstuvwxyz" substringWithRange:5 len:10];
	
	NSMutableString *strbuf = buf.b;
	
	NSMutableString *st = [StringTools urlEncode:@"http://imagin.ro/Gorgeous Elena/2"];
	st = [StringTools urlDecode:@"http://imagin.ro/Gorgeous Elena/2"];
	st = [StringTools htmlEscape:@"<a href= &>"];
	st = [StringTools htmlUnescape:@"<a href= &>"];
	st = [StringTools ltrim:@" abcdefgh"];
	st = [StringTools rtrim:@"abcdefgh "];
	st = [StringTools trim:@" abcdefgh "];
	st = [StringTools rpad:@"abcdefgh" c:@"0" l:10];
	st = [StringTools lpad:@"abcdefgh" c:@"0" l:10];
	st = [StringTools replace:@"abcdefgh" sub:@"abc" by:@"_abc"];
	BOOL b = [StringTools startsWith:@"abcdefg" start:@"abc"];
	b = [StringTools endsWith:@"abcdefg" end:@"efg"];
	b = [StringTools isSpace:@"abcdefg" pos:3];
	
	NSMutableString *i2 = [StringTools hex:345345 digits:10];
	
	NSMutableString *sfin = [strbuf stringByAppendingString:st];
	sfin = [[strbuf stringByAppendingString:st] stringByAppendingString:s2];
	[sfin appendString:@"abc"];
	sfin = [[st stringByAppendingString:@"abc"] stringByAppendingString:@"5"];
	sfin = [@"55" stringByAppendingString:@"abc"];
}
- (void) testSys{
	[Sys print:@"hello world"];
	[Sys println:@"hello world"];
}
- (void) testType{
}
- (void) testXml{
}
- (void) testTimer{
	
	NSMutabeArray *_g = [[NSMutableArray alloc] initWithObjects:self, nil]];
	
	Timer *timer = [[Timer alloc] new:50];
	timer.run = @selector(testXml);
	[timer stop];
	timer = [Timer delay:@selector(testTimer) time_ms:50];
	timer = [Timer delay:(void){
		[[_g objectAtIndex:0] testTimer];
	} time_ms:50];
	[Timer measure:@selector(testTimer) pos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"332",@"Tests",@"testTimer",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	float f = [Timer stamp];
}
- (void) testFrameworksImport{
	
	MKMapView *m = [[MKMapView alloc] new];
}
- (int) getWidth{
	return 0;
}
- (int) setWidth:(int)v{
	return 0;
}
- (int) add:(int)a b:(int)b{
	return a + b;
}
- (int) minus:(int)a b:(int)b{
	return a - b;
}
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
}
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(id)arg4{
}
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
}
- (void) optionalArguments2:(int)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(int)arg4{
}
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(id)arg3 arg4:(int)arg4{
}
- (void) init{
	int x = 6;
	self.s = @"init";
}
- (void) printHello{
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"378",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
- (id) new{
	self = [super init];
	self.s = @"str";
	self.d2 = 4.5;
	self.d1 = 34;
	return self;
}

@end
