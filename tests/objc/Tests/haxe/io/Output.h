

#import "Bytes.h"
#import "Array.h"
#import "Error.h"
#import "Output.h"
#import "CppInt32__.h"
#import "Input.h"

@interface Output : NSObject

+ (float) LN2:(float)val;
@property (nonatomic, setter=setEndian) BOOL bigEndian;
- (void) writeByte:(int)c;
- (int) writeBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (void) flush;
- (void) close;
- (BOOL) setEndian:(BOOL)b;
- (void) write:(Bytes*)s;
- (void) writeFullBytes:(Bytes*)s pos:(int)pos len:(int)len;
- (void) writeFloat:(float)x;
- (void) writeDouble:(float)x;
- (void) writeInt8:(int)x;
- (void) writeInt16:(int)x;
- (void) writeUInt16:(int)x;
- (void) writeInt24:(int)x;
- (void) writeUInt24:(int)x;
- (void) writeInt31:(int)x;
- (void) writeUInt30:(int)x;
- (void) writeInt32:(CppInt32__*)x;
- (void) prepare:(int)nbytes;
- (void) writeInput:(Input*)i bufsize:(id)bufsize;
- (void) writeString:(NSMutableString*)s;

@end
