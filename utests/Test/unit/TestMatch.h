//
//  TestMatch
//  Test
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	Leaf,
	Node
} Tree;
typedef enum{
	TA,
	TB,
	TC
} A;
typedef enum{
	U1,
	U2
} X;


#import "../String.h"
#import "../haxe/macro/Expr.h"
#import "../Std.h"
#import "../Array.h"
#import "../StringTools.h"
#import "../Class.h"
#import "../unit/MyClass.h"
#import "../Type.h"
#import "../unit/TestMatch.h"
#import "../haxe/macro/ExprDef.h"
#import "../haxe/macro/Constant.h"
#import "../unit/A.h"
#import "../unit/InitBase.h"
#import "../unit/X.h"
#import "../unit/Test.h"

@interface TestMatch : Test 

+ (NSMutableString*) switchNormal:(id)e;
+ (Expr*) switchCapture:(id)e;
+ (NSMutableString*) switchArray:(id)e;
+ (NSMutableString*) switchArray2:(NSMutableArray*)a;
+ (NSMutableString*) switchStructure:(id)a;
+ (NSMutableString*) switchCrazy:(id)e;
+ (NSMutableString*) switchGuard:(id)e;
+ (NSMutableString*) switchClass:(Class*)cl;
+ (NSMutableString*) toStringX:(TestMatch*)x1;
- (void) testBasic;
- (void) testTuple;
- (void) testGrouping;
- (void) testSubtyping;
- (void) testGadt;
- (void) testClassSwitch;
- (void) testNonExhaustiveness;
- (void) testInvalidBinding;
- (id) init;

@end

