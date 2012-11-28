#import "Output.h"

@implementation Output

+ (float) LN2:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = logf(2); }
	else { if (_val != nil) _val = val; }
	return _val;
}

- (void) writeByte:(int)c{
	throw @"Not implemented";
}
- (int) writeBytes:(Bytes*)s pos:(int)pos len:(int)len{
	int k = len;
	
	NSMutabeArray *b = s.b;
	if (pos < 0 || len < 0 || pos + len > s.length) throw Error.OutsideBounds;
	while (k > 0) {
		[self writeByte:[b objectAtIndex:pos]];
		pos++;
		k--;
	}
	return len;
}
- (void) flush{
}
- (void) close{
}
- (BOOL) setEndian:(BOOL)b{
	self.bigEndian = b;
	return b;
}
- (void) write:(Bytes*)s{
	int l = s.length;
	int p = 0;
	while (l > 0) {
		int k = [self writeBytes:s pos:p len:l];
		if (k == 0) throw Error.Blocked;
		p += k;
		l -= k;
	}
}
- (void) writeFullBytes:(Bytes*)s pos:(int)pos len:(int)len{
	while (len > 0) {
		int k = [self writeBytes:s pos:pos len:len];
		pos += k;
		len -= k;
	}
}
- (void) writeFloat:(float)x{
	if (x == 0.0) {
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		return;
	}
	int exp = floorf(logf(absf(x))] / Output.LN2)];
	int sig = floorf(absf(x) / powf(2, exp) * 8388608)] & 8388607;
	int b1 = exp + 127 >> 1 |  (( (exp > 0) ? ( (x < 0) ? 128 : 64) : ( (x < 0) ? 128 : 0))); int b2 = (exp + 127 << 7 & 255) | (sig >> 16 & 127); int b3 = sig >> 8 & 255; int b4 = sig & 255;
	if (self.bigEndian) {
		[self writeByte:b4];
		[self writeByte:b3];
		[self writeByte:b2];
		[self writeByte:b1];
	}
	else {
		[self writeByte:b1];
		[self writeByte:b2];
		[self writeByte:b3];
		[self writeByte:b4];
	}
}
- (void) writeDouble:(float)x{
	if (x == 0.0) {
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		[self writeByte:0];
		return;
	}
	int exp = floorf(logf(absf(x))] / Output.LN2)];
	int sig = floorf(absf(x) / powf(2, exp) * powf(2, 52))];
	int sig_h = sig & (int)34359738367;
	int sig_l = floorf(sig / powf(2, 32))];
	int b1 = exp + 1023 >> 4 |  (( (exp > 0) ? ( (x < 0) ? 128 : 64) : ( (x < 0) ? 128 : 0))); int b2 = (exp + 1023 << 4 & 255) | (sig_l >> 16 & 15); int b3 = sig_l >> 8 & 255; int b4 = sig_l & 255; int b5 = sig_h >> 24 & 255; int b6 = sig_h >> 16 & 255; int b7 = sig_h >> 8 & 255; int b8 = sig_h & 255;
	if (self.bigEndian) {
		[self writeByte:b8];
		[self writeByte:b7];
		[self writeByte:b6];
		[self writeByte:b5];
		[self writeByte:b4];
		[self writeByte:b3];
		[self writeByte:b2];
		[self writeByte:b1];
	}
	else {
		[self writeByte:b1];
		[self writeByte:b2];
		[self writeByte:b3];
		[self writeByte:b4];
		[self writeByte:b5];
		[self writeByte:b6];
		[self writeByte:b7];
		[self writeByte:b8];
	}
}
- (void) writeInt8:(int)x{
	if (x < -128 || x >= 128) throw Error.Overflow;
	[self writeByte:x & 255];
}
- (void) writeInt16:(int)x{
	if (x < -32768 || x >= 32768) throw Error.Overflow;
	[self writeUInt16:x & 65535];
}
- (void) writeUInt16:(int)x{
	if (x < 0 || x >= 65536) throw Error.Overflow;
	if (self.bigEndian) {
		[self writeByte:x >> 8];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8];
	}
}
- (void) writeInt24:(int)x{
	if (x < -8388608 || x >= 8388608) throw Error.Overflow;
	[self writeUInt24:x & 16777215];
}
- (void) writeUInt24:(int)x{
	if (x < 0 || x >= 16777216) throw Error.Overflow;
	if (self.bigEndian) {
		[self writeByte:x >> 16];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16];
	}
}
- (void) writeInt31:(int)x{
	if (x < -1073741824 || x >= 1073741824) throw Error.Overflow;
	if (self.bigEndian) {
		[self writeByte:x >>> 24];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >>> 24];
	}
}
- (void) writeUInt30:(int)x{
	if (x < 0 || x >= 1073741824) throw Error.Overflow;
	if (self.bigEndian) {
		[self writeByte:x >>> 24];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x & 255];
	}
	else {
		[self writeByte:x & 255];
		[self writeByte:x >> 8 & 255];
		[self writeByte:x >> 16 & 255];
		[self writeByte:x >>> 24];
	}
}
- (void) writeInt32:(CppInt32__*)x{
	if (self.bigEndian) {
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:24]]];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:16]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:8]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ and:x b:[CppInt32__ ofInt:255]]]];
	}
	else {
		[self writeByte:[CppInt32__ toInt:[CppInt32__ and:x b:[CppInt32__ ofInt:255]]]];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:8]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:16]] & 255];
		[self writeByte:[CppInt32__ toInt:[CppInt32__ ushr:x b:24]]];
	}
}
- (void) prepare:(int)nbytes{
}
- (void) writeInput:(Input*)i bufsize:(id)bufsize{
	if (bufsize == nil) bufsize = 4096;
	
	Bytes *buf = [Bytes alloc:bufsize];
	@try {
		while (YES) {
			int len = [i readBytes:buf pos:0 len:bufsize];
			if (len == 0) throw Error.Blocked;
			int p = 0;
			while (len > 0) {
				int k = [self writeBytes:buf pos:p len:len];
				if (k == 0) throw Error.Blocked;
				p += k;
				len -= k;
			}
		}
	}
	@catch (NSException *e) {
	}
}
- (void) writeString:(NSMutableString*)s{
	
	Bytes *b = [Bytes ofString:s];
	[self writeFullBytes:b pos:0 len:b length];
}

@end
