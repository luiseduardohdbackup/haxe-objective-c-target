package objc.foundation;
import objc.foundation.NSObjCRuntime;
import objc.foundation.NSZone;
typedef Protocol = Dynamic;
typedef IMP = Dynamic;

extern class NSObject {
	
	// Sending Messages
/*	function performSelector:withObject:afterDelay:
	function performSelector:withObject:afterDelay:inModes:
	function performSelectorOnMainThread:withObject:waitUntilDone:
	function performSelectorOnMainThread:withObject:waitUntilDone:modes:
	function performSelector:onThread:withObject:waitUntilDone:
	function performSelector:onThread:withObject:waitUntilDone:modes:
	function performSelectorInBackground:withObject:
	static function cancelPreviousPerformRequestsWithTarget:
	static function cancelPreviousPerformRequestsWithTarget:selector:object:*/
	
	// Forwarding Messages
/*	function forwardingTargetForSelector:*/
/*	function forwardInvocation:*/


/***********	Base class		***********/

	public static function load () :Void;

	public static function initialize () :Void;
	public function init () :NSObject;

	public function new () :Void;
	public static function allocWithZone (zone:NSZone) :NSObject;
	public static function alloc () :NSObject;
	//public function dealloc () :Void;

	public function finalize () :Void;

	public function copy () :NSObject;
	public function mutableCopy () :NSObject;

	public static function copyWithZone (zone:NSZone) :NSObject;
	public static function mutableCopyWithZone (zone:NSZone) :NSObject;

	public static function superclass () :Class<Dynamic>;
	public static function _class () :Class<Dynamic>;
	public static function instancesRespondToSelector (aSelector:SEL) :Bool;
	public static function conformsToProtocol (protocol:Protocol) :Bool;
	public function methodForSelector (aSelector:SEL) :IMP;
	public static function instanceMethodForSelector (aSelector:SEL) :IMP;
	public function doesNotRecognizeSelector (aSelector:SEL) :Void;

	public function forwardingTargetForSelector (aSelector:SEL) :NSObject;
	public function forwardInvocation (anInvocation:NSInvocation) :Void;
	public function methodSignatureForSelector (aSelector:SEL) :NSMethodSignature;

	public static function instanceMethodSignatureForSelector (aSelector:SEL) :NSMethodSignature;

	//public function allowsWeakReference () :Void;
	//public function retainWeakReference () :Void;

	public static function description () :String;
	
	public static function isSubclassOfClass (aClass:Class<Dynamic>) :Bool;
	
	public static function resolveClassMethod (sel:SEL) :Bool;
	public static function resolveInstanceMethod (sel:SEL) :Bool;
	
	// NSCoderMethods
	
	public static function version () :Int;
	public static function setVersion(aVersion:Int) :Void;
	public function classForCoder () :Class<Dynamic>;
	public function replacementObjectForCoder (aCoder:NSCoder) :NSObject;
	public function awakeAfterUsingCoder (aDecoder:NSCoder) :NSObject;

}


/***************	Basic protocols		***************/
// Having an interface and a class with the same name causes problems
extern interface NSObjectProtocol {

	public function isEqual (object:Dynamic) :Bool;
	public function hash () :Int;

	public function superclass () :Class<Dynamic>;
	public function _class () :Class<Dynamic>;
	public function self () :NSObject;

	//public function performSelector (aSelector:SEL) :NSObject;
	public function performSelector (aSelector:SEL, withObject:Dynamic) :NSObject;
	//public function performSelector (aSelector:SEL, withObject:Dynamic, withObject:Dynamic) :NSObject;

	public function isProxy () :Bool;

	public function isKindOfClass (aClass:Class<Dynamic>) :Bool;
	public function isMemberOfClass (aClass:Class<Dynamic>) :Bool;
	public function conformsToProtocol (aProtocol:Protocol) :Bool;

	public function respondsToSelector (aSelector:SEL) :Bool;

	public function description () :String;

}

/***********	Discardable Content		***********/

extern interface NSDiscardableContent {

/*	public function beginContentAccess () :Bool;
	public function endContentAccess () :Void;
	public function discardContentIfPossible () :Void;
	public function isContentDiscarded () :Bool;*/

}

extern interface  NSCopying {

	//public function copyWithZone (zone:NSZone) :NSObject;

}

extern interface  NSMutableCopying {

	//public function mutableCopyWithZone (zone:NSZone) :NSObject;

}

extern interface NSCoding {

	//public function encodeWithCoder (aCoder:NSCoder) :Void;
	//public function initWithCoder (aDecoder:NSCoder) :NSObject;

}

extern interface NSSecureCoding {
	
	//public static function supportsSecureCoding () :Bool;
	
}
