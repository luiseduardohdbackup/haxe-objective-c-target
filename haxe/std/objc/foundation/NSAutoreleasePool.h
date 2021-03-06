/*	NSAutoreleasePool.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

import objc.foundation.NSObject;

NS_AUTOMATED_REFCOUNT_UNAVAILABLE
extern class NSAutoreleasePool extends NSObject {
@private
    void	*_token;
    void	*_reserved3;
    void	*_reserved2;
    void	*_reserved;
}

+ (void)addObject:(id)anObject;

- (void)addObject:(id)anObject;

- (void)drain;

}

