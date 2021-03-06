/*
 *  NSPointerFunctions.h
 *
 *  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
 *
 */
 

#import <Foundation/NSObject.h>

#if !defined(__FOUNDATION_NSPOINTERFUNCTIONS__)
#define __FOUNDATION_NSPOINTERFUNCTIONS__ 1

/*

  NSPointerFunctions

  This object defines callout functions appropriate for managing a pointer reference held somewhere else.

  Used by NSHashTable, NSMapTable, and NSPointerArray, this object defines the acquision and retention behavior for the pointers provided to these collection objects.

   The functions are separated into two clusters - those that define "personality", such as object or cString, and those that describe memory management issues such as a memory deallocation function.  Common personalities and memory manager selections are provided as enumerations, and further customization is provided by methods such that the composition of the actual list of functions is done opaquely such that they can be extended in the future.

  The pointer collections copy NSPointerFunctions objects on input and output, and so NSPointerFunctions is not usefully subclassed.

*/


enum {
    // Memory options are mutually exclusive
    
    // default is strong
    NSPointerFunctionsStrongMemory NS_ENUM_AVAILABLE(10_5, 6_0) = (0UL << 0),       // use strong write-barrier to backing store; use GC memory on copyIn
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || TARGET_OS_WIN32
    NSPointerFunctionsZeroingWeakMemory NS_ENUM_DEPRECATED_MAC(10_5, 10_8) = (1UL << 0),  // deprecated; uses GC weak read and write barriers, and dangling pointer behavior otherwise 
#endif
    NSPointerFunctionsOpaqueMemory NS_ENUM_AVAILABLE(10_5, 6_0) = (2UL << 0),
    NSPointerFunctionsMallocMemory NS_ENUM_AVAILABLE(10_5, 6_0) = (3UL << 0),       // free() will be called on removal, calloc on copyIn
    NSPointerFunctionsMachVirtualMemory NS_ENUM_AVAILABLE(10_5, 6_0) = (4UL << 0),
    NSPointerFunctionsWeakMemory NS_ENUM_AVAILABLE(10_8, 6_0) = (5UL << 0),         // uses weak read and write barriers appropriate for ARC or GC
    
    // Personalities are mutually exclusive
    // default is object.  As a special case, 'strong' memory used for Objects will do retain/release under non-GC
    NSPointerFunctionsObjectPersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (0UL << 8),         // use -hash and -isEqual, object description
    NSPointerFunctionsOpaquePersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (1UL << 8),         // use shifted pointer hash and direct equality
    NSPointerFunctionsObjectPointerPersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (2UL << 8),  // use shifted pointer hash and direct equality, object description
    NSPointerFunctionsCStringPersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (3UL << 8),        // use a string hash and strcmp, description assumes UTF-8 contents; recommended for UTF-8 (or ASCII, which is a subset) only cstrings
    NSPointerFunctionsStructPersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (4UL << 8),         // use a memory hash and memcmp (using size function you must set)
    NSPointerFunctionsIntegerPersonality NS_ENUM_AVAILABLE(10_5, 6_0) = (5UL << 8),        // use unshifted value as hash & equality

    NSPointerFunctionsCopyIn NS_ENUM_AVAILABLE(10_5, 6_0) = (1UL << 16),      // the memory acquire function will be asked to allocate and copy items on input
};

typedef NSUInteger NSPointerFunctionsOptions;

NS_CLASS_AVAILABLE(10_5, 6_0)
extern class NSPointerFunctions extends NSObject implements NSCopying>
// construction
- (id)initWithOptions:(NSPointerFunctionsOptions)options;
+ (id)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options;

// pointer personality functions
	public var  NSUInteger (*hashFunction)(const void *item, NSUInteger (*size)(const void *item));
	public var  Bool (*isEqualFunction)(const void *item1, const void*item2, NSUInteger (*size)(const void *item));
	public var  NSUInteger (*sizeFunction)(const void *item);
	public var  NSString *(*descriptionFunction)(const void *item);

// custom memory configuration
	public var  void (*relinquishFunction)(const void *item, NSUInteger (*size)(const void *item));
	public var  void *(*acquireFunction)(const void *src, NSUInteger (*size)(const void *item), Bool shouldCopy);

// GC requires that read and write barrier functions be used when pointers are from GC memory
	public var  Bool usesStrongWriteBarrier;             // pointers should (not) be assigned using the GC strong write barrier
	public var  Bool usesWeakReadAndWriteBarriers;       // pointers should (not) use GC weak read and write barriers
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)) || TARGET_OS_WIN32

#else

#if defined(__has_include)
#if __has_include(<Foundation/NSPointerFunctionsPriv.h>)
#include <Foundation/NSPointerFunctionsPriv.h>
#endif
#endif

#endif

/*
   Cheat Sheet
 
   Long Integers (other than zero)   (NSPointerFunctionsOpaqueMemory | NSPointerFunctionsIntegerPersonality)
      useful for, well, anything that can be jammed into a long int
 
   Strongly held objects             (NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPersonality)
      used for retained objects under ARC and/or manual retain-release, or GC; uses isEqual: as necessary
 
   Zeroing weak object references    (NSPointerFunctionsWeakMemory   | NSPointerFunctionsObjectPersonality)
      used to hold references that won't keep the object alive.  Note that objects implementing custom retain-release must also implement allowsWeakReference and retainWeakReference (or are using GC instead)
 
   Unsafe unretained objects         (NSPointerFunctionsOpaqueMemory | NSPointerFunctionsObjectPersonality)
      used where zeroing weak is not possible and where, somehow, the objects are removed before being deallocated.
 
   C String where table keeps copy   (NSPointerFunctionsStrongMemory | NSPointerFunctionsCStringPersonality | NSPointerFunctionsCopyIn)
      used to capture a null-terminated string from a source with unknown lifetime.  Keeps string alive under GC.  Under ARC/RR, table will deallocate its copy when removed.  Generally, "C Strings" is a term for UTF8 strings as well.
 
   C String, owned elsewhere         (NSPointerFunctionsOpaqueMemory | NSPointerFunctionsCStringPersonality)
      used to hold C string pointers to storage not at all managed by the table.
 
 
   The NSPointerFunctionsObjectPersonality dictates using isEqual: for the equality test.  In some situations == should be used, such as when trying to build a cache of unique immutable "value" objects that implement isEqual:.  In those cases use NSPointerFunctionsObjectPointerPersonality instead.

   Deprecated
 
   GC Zeroing - ARC/RR unsafe weak   (NSPointerFunctionsZeroingWeakMemory   | NSPointerFunctionsObjectPersonality)
       under GC these are zeroing weak but under manual retain-release (or ARC) these are unsafe unretained. Move to NSPointerFunctionsWeakMemory or NSPointerFunctionsOpaqueMemory instead.
 
 
   Example
       Lets say you have a source of C Strings that often repeat and you need to provide unique NSString counterparts.  For this you likely want a NSMapTable with strong copy-in C Strings as the keys and weak NSString values.  As long as the NSString counterparts are in use, they stay in the table and don't need to be created each time they show up.
       NSMapTable *mt = [[NSMapTable alloc] 
                            initWithKeyOptions: (NSPointerFunctionsStrongMemory | NSPointerFunctionsCStringPersonality | NSPointerFunctionsCopyIn)
                            valueOptions:(NSPointerFunctionsWeakMemory   | NSPointerFunctionsObjectPersonality)
                            capacity:0];
       ...
       // given a C string, look it up and, if not found, create and save the NSString version in the table
       const char *cString = ...;
       NSString *result = [mt objectForKey:(id)cString];
       if (!result) {
            result = [NSString stringWithCString:cString];
            [mt setObject:result forKey:(id)cString];
        }
        return result;
*/

#endif

