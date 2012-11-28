

#import "Bytes.h"
#import "Array.h"
#import "Error.h"
#import "StringBuf.h"

@interface Bytes : NSObject

+ (Bytes*) alloc:(int)length;
+ (Bytes*) ofString:(NSMutableString*)s;
+ (Bytes*) ofData:(NSMutabeArray*)b;
@property (nonatomic) int length;
@property (nonatomic, strong) NSMutabeArray *b;
- (int) get:(int)pos;
- (void) set:(int)pos v:(int)v;
- (void) blit:(int)pos src:(Bytes*)src srcpos:(int)srcpos len:(int)len;
- (Bytes*) sub:(int)pos len:(int)len;
- (int) compare:(Bytes*)other;
- (NSMutableString*) readString:(int)pos len:(int)len;
- (NSMutableString*) toString;
- (NSMutableString*) toHex;
- (NSMutabeArray*) getData;
- (id) new:(int)length b:(NSMutabeArray*)b;

@end
