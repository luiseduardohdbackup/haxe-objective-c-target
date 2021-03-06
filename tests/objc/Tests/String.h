//
//  String
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "String.h"
#import "Array.h"

@interface NSMutableString ( String )

+ (NSMutableString*) fromCharCode:(int)code;
@property (nonatomic) int length;
- (NSMutableString*) toUpperCase;
- (NSMutableString*) toLowerCase;
- (NSMutableString*) charAt:(int)index;
- (int) charCodeAt:(int)index;
- (int) indexOf:(NSMutableString*)str startIndex:(int)startIndex;
- (int) lastIndexOf:(NSMutableString*)str startIndex:(int)startIndex;
- (NSMutableArray*) split:(NSMutableString*)delimiter;
- (NSMutableString*) substr:(int)pos len:(int)len;
- (NSMutableString*) substring:(int)startIndex endIndex:(int)endIndex;
- (NSMutableString*) toString;
- (id) init:(NSMutableString*)string;

@end

