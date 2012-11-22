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

@class DOMFileList;
@class DOMHTMLFormElement;
@class NSString;
@class NSURL;

extern class DOMHTMLInputElement : DOMHTMLElement
	public var NSString *accept;
	public var NSString *alt;
	public var  BOOL autofocus AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  BOOL defaultChecked;
	public var  BOOL checked;
	public var  BOOL disabled;
	public var (default, null) DOMHTMLFormElement *form;
	public var (default, null) DOMFileList *files AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  BOOL indeterminate AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  int maxLength;
	public var  BOOL multiple AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var NSString *name;
	public var  BOOL readOnly;
	public var NSString *size;
	public var NSString *src;
	public var NSString *type;
	public var NSString *defaultValue;
	public var NSString *value;
	public var  (default, null) : BOOL willValidate AVAILABLE_IN_WEBKIT_VERSION_4_0;
	public var  int selectionStart AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var  int selectionEnd AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var NSString *align;
	public var NSString *useMap;
	public var NSString *accessKey AVAILABLE_WEBKIT_VERSION_1_3_AND_LATER_BUT_DEPRECATED_AFTER_WEBKIT_VERSION_5_1;
	public var (default, null) NSString *altDisplayString AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
	public var (default, null) NSURL *absoluteImageURL AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;

- (void)select;
- (void)setSelectionRange:(int)start end:(int)end AVAILABLE_WEBKIT_VERSION_3_0_AND_LATER;
- (void)click;
}

#endif
