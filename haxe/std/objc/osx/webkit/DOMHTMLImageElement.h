/*
 * Copyright (C) 2004, 2005, 2006, 2007, 2008, 2009 Apple Inc. All rights reserved.
 * Copyright (C) 2006 Samuel Weinig <sam.weinig@gmail.com>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE COMPUTER, INC. ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE COMPUTER, INC. OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

#import <WebKit/DOMHTMLElement.h>

#if WEBKIT_VERSION_MAX_ALLOWED >= WEBKIT_VERSION_1_3

@class NSString;
@class NSURL;

extern class DOMHTMLImageElement : DOMHTMLElement
	public var NSString *name;
	public var NSString *align;
	public var NSString *alt;
	public var NSString *border;
	public var  int height;
	public var  int hspace;
	public var  BOOL isMap;
	public var NSString *longDesc;
	public var NSString *src;
	public var NSString *useMap;
	public var  int vspace;
	public var  int width;
	public var  (default, null) : BOOL complete AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var NSString *lowsrc AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) : int naturalHeight AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) : int naturalWidth AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) : int x AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  (default, null) : int y AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var (default, null) NSString *altDisplayString AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var (default, null) NSURL *absoluteImageURL AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
}

#endif
