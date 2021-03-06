//
//  Lambda
//  Tests
//
//  Source generated by Haxe Objective-C target
//



#import "Array.h"
#import "List.h"

@interface Lambda : HXObject

+ (NSMutableArray*) array:(id)it;
+ (List*) list:(id)it;
+ (List*) map:(id)it f:(SEL)f;
+ (List*) mapi:(id)it f:(SEL)f;
+ (BOOL) has:(id)it elt:(id)elt cmp:(SEL)cmp;
+ (BOOL) exists:(id)it f:(SEL)f;
+ (BOOL) foreach:(id)it f:(SEL)f;
+ (void) iter:(id)it f:(SEL)f;
+ (List*) filter:(id)it f:(SEL)f;
+ (id) fold:(id)it f:(SEL)f first:(id)first;
+ (int) count:(id)it pred:(SEL)pred;
+ (BOOL) empty:(id)it;
+ (int) indexOf:(id)it v:(id)v;
+ (List*) concat:(id)a b:(id)b;

@end

