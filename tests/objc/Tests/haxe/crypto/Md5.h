//
//  Md5
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "../../String.h"
#import "../../haxe/io/Bytes.h"
#import "../../Array.h"
#import "../../haxe/crypto/Md5.h"

@interface Md5 : HXObject

+ (NSMutableString*) encode:(NSMutableString*)s;
+ (Bytes*) make:(Bytes*)b;
+ (NSMutableArray*) bytes2blks:(Bytes*)b;
+ (NSMutableArray*) str2blks:(NSMutableString*)str;
- (int) bitOR:(int)a b:(int)b;
- (int) bitXOR:(int)a b:(int)b;
- (int) bitAND:(int)a b:(int)b;
- (int) addme:(int)x y:(int)y;
- (NSMutableString*) hex:(NSMutableArray*)a;
- (int) rol:(int)num cnt:(int)cnt;
- (int) cmn:(int)q a:(int)a b:(int)b x:(int)x s:(int)s t:(int)t;
- (int) ff:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t;
- (int) gg:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t;
- (int) hh:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t;
- (int) ii:(int)a b:(int)b c:(int)c d:(int)d x:(int)x s:(int)s t:(int)t;
- (NSMutableArray*) doEncode:(NSMutableArray*)x;
- (id) init;

@end

