/* * Copyright (c) 2005, The haXe Project Contributors * All rights reserved. * Redistribution and use in source and binary forms, with or without * modification, are permitted provided that the following conditions are met: * *   - Redistributions of source code must retain the above copyright *     notice, this list of conditions and the following disclaimer. *   - Redistributions in binary form must reproduce the above copyright *     notice, this list of conditions and the following disclaimer in the *     documentation and/or other materials provided with the distribution. * * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH * DAMAGE. */import objc.foundation.NSArray;import objc.foundation.NSRange;// @:category meta is for Objc only and will transform the class into a category@:category /*@:core_api*/ @:final class Array<T> {/*	TODO: check CFArray, maybe is better than NSArray */	private var nativeArray : NSMutableArray;	public var length (default, null) : Int;	public function new() : Void {		this.nativeArray = new NSMutableArray();		this.length = 0;	}	public function initWithNSMutableArray (array : NSMutableArray) :Array<T> {		this.nativeArray = array;		this.length = array.count();		return this;	}	public function concat( a : Array<T>) : Array<T> {		var nat = a.nativeArray;		return null;		//return new Array<T>().initWithNSMutableArray ( nativeArray.arrayByAddingObjectsFromArray ( nat ));	}	public function copy() : Array<T> {		return new Array<T>().initWithNSMutableArray ( NSMutableArray.arrayWithArray(nativeArray) );	}	public function iterator() : Iterator<T> {		return null;/*untyped {					a : this,					p : 0,					hasNext : function() {						return __this__.p < __this__.a.length;					},					next : function() {						var i = __this__.a.nativeArray[__this__.p];						__this__.p += 1;						return i;					}				};*/	}	public function insert( pos : Int, x : T ) : Void {		nativeArray.insertObject (x, pos);		this.length = nativeArray.count();	}	public function join( sep : String ) : String {		return nativeArray.componentsJoinedByString( sep );	}	public function toString() : String {		//[NSString stringWithFormat:@"[\"%@\"", [self.nativeArray componentsJoinedByString:@","]];		return "[" + nativeArray.componentsJoinedByString(",") + "]";	}	public function pop() : Null<T> {		if( this.length == 0 )			return null;		var theLastObject :T = nativeArray.lastObject();		nativeArray.removeLastObject();		this.length = nativeArray.count();		return theLastObject;	}	public function push(x:T) : Int {		nativeArray.addObject(x);		this.length = nativeArray.count();		return nativeArray.count();	}	public function unshift(x : T) : Void {		nativeArray.insertObject (x, 0);		this.length = nativeArray.count();	}	public function remove(x : T) : Bool {		var containsObject :Bool = nativeArray.containsObject(x);		if (containsObject) nativeArray.removeObject(x);		this.length = nativeArray.count();		return containsObject;	}	public function reverse() : Void {		untyped __objc__("nativeArray = [[nativeArray reverseObjectEnumerator] allObjects]");/*		NSMutableArray * reverseArray = [NSMutableArray arrayWithCapacity:[myArray count]]; 		for (id element in [myArray reverseObjectEnumerator]) {		    [reverseArray addObject:element];		}*/	}	public function shift() : Null<T> {		if (this.length > 0) {			var obj = nativeArray.objectAtIndex ( 0 );			nativeArray.removeObjectAtIndex ( 0 );			this.length = nativeArray.count();			return obj;		}		return null;	}	public function slice( pos : Int, ?end : Int ) : Array<T> {		return splice (pos, end-pos);	}	public function sort(f:T->T->Int) : Void {			}	public function splice( pos : Int, len : Int ) : Array<T> {		// TODO: Test which method is faster		var newArray :NSMutableArray = nativeArray.subarrayWithRange ( new NSRange (pos, len));		nativeArray.removeObjectsInArray ( newArray );/*		nativeArray.removeObjectsInRange ( new NSRange (pos, len));*/		this.length = nativeArray.count();		return new Array<T>().initWithNSMutableArray ( newArray );	}}