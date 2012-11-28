

#import "Bytes.h"
#import "FileSeek.h"
#import "Output.h"

@interface FileOutput : Output 

@property (nonatomic) id __f;
- (void) writeByte:(int)c;
- (int) writeBytes:(Bytes*)s p:(int)p l:(int)l;
- (void) flush;
- (void) close;
- (void) seek:(int)p pos:(FileSeek*)pos;
- (int) tell;
- (id) new:(id)f;

@end
