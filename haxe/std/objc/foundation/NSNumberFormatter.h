/*	NSNumberFormatter.h
	Copyright (c) 1996-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSFormatter.h>
#include <CoreFoundation/CFNumberFormatter.h>

@class NSLocale, NSError, NSMutableDictionary;

extern class NSNumberFormatter extends NSFormatter {
@private
    NSMutableDictionary	*_attributes;
    __strong CFNumberFormatterRef _formatter;
    NSUInteger _counter;
    void *_reserved[12];
}

// - (id)init; // designated initializer

// Report the used range of the string and an NSError, in addition to the usual stuff from NSFormatter

- (Bool)getObjectValue:(out id *)obj forString:(NSString *)string range:(inout NSRange *)rangep error:(out NSError **)error;

// Even though NSNumberFormatter responds to the usual NSFormatter methods,
//   here are some convenience methods which are a little more obvious.

- (NSString *)stringFromNumber:(NSNumber *)number;
- (NSNumber *)numberFromString:(NSString *)string;

typedef NS_ENUM(NSUInteger, NSNumberFormatterStyle) {
    NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
    NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
    NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
    NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
    NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
    NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
};

typedef NS_ENUM(NSUInteger, NSNumberFormatterBehavior) {
    NSNumberFormatterBehaviorDefault = 0,
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    NSNumberFormatterBehavior10_0 = 1000,
#endif
    NSNumberFormatterBehavior10_4 = 1040,
};


+ (NSString *)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle NS_AVAILABLE(10_6, 4_0);

// Attributes of an NSNumberFormatter

- (NSNumberFormatterStyle)numberStyle;
- (void)setNumberStyle:(NSNumberFormatterStyle)style;

- (NSLocale *)locale;
- (void)setLocale:(NSLocale *)locale;

- (Bool)generatesDecimalNumbers;
- (void)setGeneratesDecimalNumbers:(Bool)b;

- (NSNumberFormatterBehavior)formatterBehavior;
- (void)setFormatterBehavior:(NSNumberFormatterBehavior)behavior;

+ (NSNumberFormatterBehavior)defaultFormatterBehavior;
+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior;

- (NSString *)negativeFormat;
- (void)setNegativeFormat:(NSString *)format;

- (NSDictionary *)textAttributesForNegativeValues;
- (void)setTextAttributesForNegativeValues:(NSDictionary *)newAttributes;

- (NSString *)positiveFormat;
- (void)setPositiveFormat:(NSString *)format;

- (NSDictionary *)textAttributesForPositiveValues;
- (void)setTextAttributesForPositiveValues:(NSDictionary *)newAttributes;

- (Bool)allowsFloats;
- (void)setAllowsFloats:(Bool)flag;

- (NSString *)decimalSeparator;
- (void)setDecimalSeparator:(NSString *)string;

- (Bool)alwaysShowsDecimalSeparator;
- (void)setAlwaysShowsDecimalSeparator:(Bool)b;

- (NSString *)currencyDecimalSeparator;
- (void)setCurrencyDecimalSeparator:(NSString *)string;

- (Bool)usesGroupingSeparator;
- (void)setUsesGroupingSeparator:(Bool)b;

- (NSString *)groupingSeparator;
- (void)setGroupingSeparator:(NSString *)string;


- (NSString *)zeroSymbol;
- (void)setZeroSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForZero;
- (void)setTextAttributesForZero:(NSDictionary *)newAttributes;

- (NSString *)nilSymbol;
- (void)setNilSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNil;
- (void)setTextAttributesForNil:(NSDictionary *)newAttributes;

- (NSString *)notANumberSymbol;
- (void)setNotANumberSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNotANumber;
- (void)setTextAttributesForNotANumber:(NSDictionary *)newAttributes;

- (NSString *)positiveInfinitySymbol;
- (void)setPositiveInfinitySymbol:(NSString *)string;

- (NSDictionary *)textAttributesForPositiveInfinity;
- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)newAttributes;

- (NSString *)negativeInfinitySymbol;
- (void)setNegativeInfinitySymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNegativeInfinity;
- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)newAttributes;


- (NSString *)positivePrefix;
- (void)setPositivePrefix:(NSString *)string;

- (NSString *)positiveSuffix;
- (void)setPositiveSuffix:(NSString *)string;

- (NSString *)negativePrefix;
- (void)setNegativePrefix:(NSString *)string;

- (NSString *)negativeSuffix;
- (void)setNegativeSuffix:(NSString *)string;

- (NSString *)currencyCode;
- (void)setCurrencyCode:(NSString *)string;

- (NSString *)currencySymbol;
- (void)setCurrencySymbol:(NSString *)string;

- (NSString *)internationalCurrencySymbol;
- (void)setInternationalCurrencySymbol:(NSString *)string;

- (NSString *)percentSymbol;
- (void)setPercentSymbol:(NSString *)string;

- (NSString *)perMillSymbol;
- (void)setPerMillSymbol:(NSString *)string;

- (NSString *)minusSign;
- (void)setMinusSign:(NSString *)string;

- (NSString *)plusSign;
- (void)setPlusSign:(NSString *)string;

- (NSString *)exponentSymbol;
- (void)setExponentSymbol:(NSString *)string;


- (NSUInteger)groupingSize;
- (void)setGroupingSize:(NSUInteger)number;

- (NSUInteger)secondaryGroupingSize;
- (void)setSecondaryGroupingSize:(NSUInteger)number;

- (NSNumber *)multiplier;
- (void)setMultiplier:(NSNumber *)number;

- (NSUInteger)formatWidth;
- (void)setFormatWidth:(NSUInteger)number;

- (NSString *)paddingCharacter;
- (void)setPaddingCharacter:(NSString *)string;


typedef NS_ENUM(NSUInteger, NSNumberFormatterPadPosition) {
    NSNumberFormatterPadBeforePrefix = kCFNumberFormatterPadBeforePrefix,
    NSNumberFormatterPadAfterPrefix = kCFNumberFormatterPadAfterPrefix,
    NSNumberFormatterPadBeforeSuffix = kCFNumberFormatterPadBeforeSuffix,
    NSNumberFormatterPadAfterSuffix = kCFNumberFormatterPadAfterSuffix
};

typedef NS_ENUM(NSUInteger, NSNumberFormatterRoundingMode) {
    NSNumberFormatterRoundCeiling = kCFNumberFormatterRoundCeiling,
    NSNumberFormatterRoundFloor = kCFNumberFormatterRoundFloor,
    NSNumberFormatterRoundDown = kCFNumberFormatterRoundDown,
    NSNumberFormatterRoundUp = kCFNumberFormatterRoundUp,
    NSNumberFormatterRoundHalfEven = kCFNumberFormatterRoundHalfEven,
    NSNumberFormatterRoundHalfDown = kCFNumberFormatterRoundHalfDown,
    NSNumberFormatterRoundHalfUp = kCFNumberFormatterRoundHalfUp
};


- (NSNumberFormatterPadPosition)paddingPosition;
- (void)setPaddingPosition:(NSNumberFormatterPadPosition)position;

- (NSNumberFormatterRoundingMode)roundingMode;
- (void)setRoundingMode:(NSNumberFormatterRoundingMode)mode;

- (NSNumber *)roundingIncrement;
- (void)setRoundingIncrement:(NSNumber *)number;

- (NSUInteger)minimumIntegerDigits;
- (void)setMinimumIntegerDigits:(NSUInteger)number;

- (NSUInteger)maximumIntegerDigits;
- (void)setMaximumIntegerDigits:(NSUInteger)number;

- (NSUInteger)minimumFractionDigits;
- (void)setMinimumFractionDigits:(NSUInteger)number;

- (NSUInteger)maximumFractionDigits;
- (void)setMaximumFractionDigits:(NSUInteger)number;

- (NSNumber *)minimum;
- (void)setMinimum:(NSNumber *)number;

- (NSNumber *)maximum;
- (void)setMaximum:(NSNumber *)number;

- (NSString *)currencyGroupingSeparator NS_AVAILABLE(10_5, 2_0);
- (void)setCurrencyGroupingSeparator:(NSString *)string NS_AVAILABLE(10_5, 2_0);

- (Bool)isLenient NS_AVAILABLE(10_5, 2_0);
- (void)setLenient:(Bool)b NS_AVAILABLE(10_5, 2_0);

- (Bool)usesSignificantDigits NS_AVAILABLE(10_5, 2_0);
- (void)setUsesSignificantDigits:(Bool)b NS_AVAILABLE(10_5, 2_0);

- (NSUInteger)minimumSignificantDigits NS_AVAILABLE(10_5, 2_0);
- (void)setMinimumSignificantDigits:(NSUInteger)number NS_AVAILABLE(10_5, 2_0);

- (NSUInteger)maximumSignificantDigits NS_AVAILABLE(10_5, 2_0);
- (void)setMaximumSignificantDigits:(NSUInteger)number NS_AVAILABLE(10_5, 2_0);

- (Bool)isPartialStringValidationEnabled NS_AVAILABLE(10_5, 2_0);
- (void)setPartialStringValidationEnabled:(Bool)b NS_AVAILABLE(10_5, 2_0);

}

@class NSDecimalNumberHandler;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
extern class NSNumberFormatter (NSNumberFormatterCompatibility)

- (Bool)hasThousandSeparators;
- (void)setHasThousandSeparators:(Bool)flag;
- (NSString *)thousandSeparator;
- (void)setThousandSeparator:(NSString *)newSeparator;

- (Bool)localizesFormat;
- (void)setLocalizesFormat:(Bool)flag;

- (NSString *)format;
- (void)setFormat:(NSString *)string;

- (NSAttributedString *)attributedStringForZero;
- (void)setAttributedStringForZero:(NSAttributedString *)newAttributedString;
- (NSAttributedString *)attributedStringForNil;
- (void)setAttributedStringForNil:(NSAttributedString *)newAttributedString;
- (NSAttributedString *)attributedStringForNotANumber;
- (void)setAttributedStringForNotANumber:(NSAttributedString *)newAttributedString;

- (NSDecimalNumberHandler *)roundingBehavior;
- (void)setRoundingBehavior:(NSDecimalNumberHandler *)newRoundingBehavior;

}
#endif

