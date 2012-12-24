//
//  main.m
//  app_delegate_class
//
//  Source generated by Haxe Objective-C target
//

#import ".h"

@implementation Lib

+ (void) log:(id)v{
}
+ (void) print:(id)v{
	printf ( [[v description] cStringUsingEncoding:NSStringEncodingConversionAllowLossy] );
}
+ (void) println:(id)v{
	[Lib print:v];
	printf ( "\n" );
}
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target{
	return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
+ (CLLocation*) location{
	return nil;
}

@end