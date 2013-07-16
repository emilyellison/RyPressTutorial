//
//  main.m
//  Primitives
//
//  Created by Emily on 7/16/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// THE VOID TYPE

// The void type is C’s empty data type. Its most common use case is
// to specify the return type for functions that don’t return anything.

void sayHello() {
    NSLog(@"This funciton doesn't return anything");
}

#import <Foundation/Foundation.h>

void sayHello();

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        sayHello();
        
        // INTEGER TYPES
        
        // The %d and %u characters are the core specifiers for displaying
        // signed and unsigned integers, respectively. The hh, h, l and ll
        // characters are modifiers that tell NSLog() to treat the associated
        // integer as a char, short, long, or long long, respectively.
        
        // It’s also worth noting that the BOOL type is actually part of
        // Objective-C, not C. Objective-C uses YES and NO for its Boolean
        // values instead of the true and false macros used by C.
        
        BOOL isBool = YES;
        NSLog(@"%d", isBool);
        NSLog(@"%@", isBool ? @"YES" : @"NO");
        
        char aChar = 'a';
        unsigned char anUnsignedChar = 255;
        NSLog(@"The letter %c is ASCII number %hhd", aChar, aChar);
        NSLog(@"%hhu", anUnsignedChar);
        
        short aShort = -32768;
        unsigned short anUnsignedShort = 65535;
        NSLog(@"%hd", aShort);
        NSLog(@"%hu", anUnsignedShort);
        
        int anInt = -2147483648;
        unsigned int anUnsignedInt = 4294967295;
        NSLog(@"%d", anInt);
        NSLog(@"%u", anUnsignedInt);
        
        long aLong = -9223372036854775808;
        unsigned long anUnsignedLong = 18446744073709551615;
        NSLog(@"%ld", aLong);
        NSLog(@"%lu", anUnsignedLong);
        
        long long aLongLong = 9223372036854775808;
        unsigned long long anUnsignedLongLong = 18446744073709551615;
        NSLog(@"%lld", aLongLong);
        NSLog(@"%llu", anUnsignedLongLong);
        
        // FIXED-WIDTH INTEGERS
        
        // The int<n>_t data types allow you to represent signed and
        // unsigned integers that are exactly 1, 2, 4, or 8 bytes, and the
        // int_least<n>_t variants let you constrain the minimum size of a
        // variable without specifying an exact number of bytes. In addition,
        // intmax_t is an alias for the largest integer type that the system
        // can handle.
        
        // Exact integer types
        int8_t aOneByteInt = 127;
        uint8_t aOneByteUnsignedInt = 255;
        int16_t aTwoByteInt = 32767;
        uint16_t aTwoByteUnsignedInt = 65535;
        int32_t aFourByteInt = 2147483647;
        uint32_t aFourByteUnsignedInt = 4294967295;
        int64_t anEightByteInt = 9223372036854775807;
        uint64_t anEightByteUnsignedInt = 18446744073709551615;

        // Minimum integer types
        int_least8_t aTinyInt = 127;
        uint_least8_t aTinyUnsignedInt = 255;
        int_least16_t aMediumInt = 32767;
        uint_least16_t aMediumUnsignedInt = 65535;
        int_least32_t aNormalInt = 2147483647;
        uint_least32_t aNormalUnsignedInt = 4294967295;
        int_least64_t aBigInt = 9223372036854775807;
        uint_least64_t aBigUnsignedInt = 18446744073709551615;
        
        // The largest supported integer type
        intmax_t theBiggestInt = 9223372036854775807;
        uintmax_t theBiggestUnsignedInt = 18446744073709551615;
        
        // Floating-Point Types
        // Like the integer data types, they are defined as
        // relative sizes, where float <= double <= long double
        
        // Single precision floating-point
        float aFloat = -21.09f;
        NSLog(@"%f", aFloat);
        NSLog(@"%8.2f", aFloat);
        
        // Double precision floating point
        double aDouble = -21.09;
        NSLog(@"%8.2f", aDouble);
        NSLog(@"%e", aDouble);
        
        // Extended precision flaoting-point
        long double aLongDouble = -21.09e8L;
        NSLog(@"%Lf", aLongDouble);
        NSLog(@"%Le", aLongDouble);
        
        // DETERMINING TYPE SIZES
        NSLog(@"Size of char: %zu", sizeof(char));
        NSLog(@"Size of short: %zu", sizeof(short));
        NSLog(@"Size of int: %zu", sizeof(int));
        NSLog(@"Size of long: %zu", sizeof(long));
        NSLog(@"Size of long long: %zu", sizeof(long long));
        NSLog(@"Size of float: %zu", sizeof(float));
        NSLog(@"Size of double: %zu", sizeof(double));
        
        // The size_t type is dedicated solely to representing
        // memory-related values, and it is guaranteed to be
        // able to store the maximum size of an array.
        NSLog(@"Size of size_t: %zu", sizeof(size_t));
        
        // LIMIT MACROS
        
        NSLog(@"Smallest signed char: %d", SCHAR_MIN);
        NSLog(@"Largest signed char: %d", SCHAR_MAX);
        NSLog(@"Largest unsigned char: %u", UCHAR_MAX);
        
        NSLog(@"Smallest signed short: %d", SHRT_MIN);
        NSLog(@"Largest signed short: %d", SHRT_MAX);
        NSLog(@"Largest unsigned short: %u", USHRT_MAX);
        
        NSLog(@"Smallest signed int: %d", INT_MIN);
        NSLog(@"Largest signed int: %d", INT_MAX);
        NSLog(@"Largest unsigned int: %u", UINT_MAX);
        
        NSLog(@"Smallest signed long: %ld", LONG_MIN);
        NSLog(@"Largest signed long: %ld", LONG_MAX);
        NSLog(@"Largest unsigned long: %lu", ULONG_MAX);
        
        NSLog(@"Smallest signed long long: %lld", LLONG_MIN);
        NSLog(@"Largest signed long long: %lld", LLONG_MAX);
        NSLog(@"Largest unsigned long long: %llu", ULLONG_MAX);
        
        NSLog(@"Smallest float: %e", FLT_MIN);
        NSLog(@"Largest float: %e", FLT_MAX);
        NSLog(@"Smallest double: %e", DBL_MIN);
        NSLog(@"Largest double: %e", DBL_MAX);
        
        NSLog(@"Largest possible array index: %llu", SIZE_MAX);
        
        // OBJECTIVE-C PRIMITIVES
        
        // THE ID TYPE
        
        // The id type is the generic type for all Objective-C
        // objects. You can think of it as the object-oriented
        // version of C’s void pointer. And, like a void pointer,
        // it can store a reference to any type of object.
        
        id mysteryObject = @"An NSString Object";
        NSLog(@"%@", [mysteryObject description]);
        mysteryObject = @{@"model": @"Ford", @"year": @1967};
        NSLog(@"%@", [mysteryObject description]);
        
        // THE CLASS TYPE
        Class targetClass = [NSString class];
        if ([mysteryObject isKindOfClass:targetClass]) {
            NSLog(@"Yup! That's an instance of the target class");
        }
        
        // THE SEL TYPE
        SEL someMethod = @selector(sayHello);
        
        // NSINTEGER
        
    }
    return 0;
}

