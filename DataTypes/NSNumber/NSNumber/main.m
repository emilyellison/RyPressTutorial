//
//  main.m
//  NSNumber
//
//  Created by Emily on 7/16/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // NSNUMBER
        
        // It may seem redundant to have an object-oriented
        // version of all the C primitives, but it’s necessary
        // if you want to store numeric values in an NSArray,
        // NSDictionary, or any of the other Foundation
        // Framework collections.
        
        NSNumber *aBool = [NSNumber numberWithBool:NO];
        NSNumber *aChar = [NSNumber numberWithChar:'z'];
        NSNumber *aUChar = [NSNumber numberWithUnsignedChar:255];
        NSNumber *aShort = [NSNumber numberWithShort:32767];
        NSNumber *aUShort = [NSNumber numberWithUnsignedShort:65535];
        NSNumber *anInt = [NSNumber numberWithInt:2147483647];
        NSNumber *aUInt = [NSNumber numberWithUnsignedInt:4294967295];
        NSNumber *aLong = [NSNumber numberWithLong:9223372036854775807];
        NSNumber *aULong = [NSNumber numberWithUnsignedLong:18446744073709551615];
        NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
        NSNumber *aDouble = [NSNumber numberWithDouble:26.99];
        
        NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
        NSLog(@"%c", [aChar charValue]);
        NSLog(@"%hhu", [aUChar unsignedCharValue]);
        NSLog(@"%hi", [aShort shortValue]);
        NSLog(@"%hu", [aUShort unsignedShortValue]);
        NSLog(@"%i", [anInt intValue]);
        NSLog(@"%u", [aUInt unsignedIntValue]);
        NSLog(@"%li", [aLong longValue]);
        NSLog(@"%lu", [aULong unsignedLongValue]);
        NSLog(@"%f", [aFloat floatValue]);
        NSLog(@"%f", [aDouble doubleValue]);
        
        NSNumber *anotherInt = [NSNumber numberWithInt:42];
        float asFloat = [anotherInt floatValue];
        NSLog(@"%.2f", asFloat);
        NSString *asString = [anotherInt stringValue];
        NSLog(@"%@", asString);
        
        // And, like all Objective-C objects, NSNumber can be displayed
        // with the %@ format specifier, which means that you can forget
        // about all of the C-style specifiers introduced in the Primitives
        // module. This makes life a tiny bit easier when trying to debug values:
        
        NSNumber *anotherUChar = [NSNumber numberWithUnsignedChar:255];
        NSNumber *yetAnotherInt = [NSNumber numberWithInt:2147483647];
        NSNumber *anotherFloat = [NSNumber numberWithFloat:26.99f];
        NSLog(@"%@", anotherUChar);
        NSLog(@"%@", yetAnotherInt);
        NSLog(@"%@", anotherFloat);
        
        // NUMERIC LITERALS
        
        NSNumber *aDifferentBool = @NO;
        NSNumber *aDifferentChar = @'z';
        NSNumber *aDifferentInt = @2147483647;
        NSNumber *aDifferentUInt = @4294967295U;
        NSNumber *aDifferentLong = @9223372036854775807L;
        NSNumber *aDifferentFloat = @26.99F;
        NSNumber *aDifferentDouble = @26.99;
        
        double x = 24.0;
        NSNumber *result = @(x * .15);
        NSLog(@"%.2f", [result doubleValue]);
        
        // IMMUTABILITY
        NSNumber *counter = @0;
        for (int i=0; i<10; i++) {
            counter = @([counter intValue] + 1);
            NSLog(@"%@", counter);
        }
        
        // COMPARING NUMBERS
        // While it’s possible to directly compare NSNumber
        // pointers, the isEqualToNumber: method is a much more
        // robust way to check for equality. It guarantees that two
        // values will compare equal, even if they are stored in
        // different objects.
        
        NSNumber *aInt = @27;
        NSNumber *sameInt = @27U;
        // Pointer comparison (fails)
        if (aInt == sameInt) {
            NSLog(@"They are the same object");
        }
        // Value comparison (succeeds)
        if ([aInt isEqualToNumber:sameInt]) {
            NSLog(@"They are the same value");
        }
        
        NSNumber *yInt = @27;
        NSNumber *zInt = @42;
        NSComparisonResult thisResult = [yInt compare:zInt];
        if (thisResult == NSOrderedAscending) {
            NSLog(@"27 < 42");
        } else if (thisResult == NSOrderedSame) {
            NSLog(@"27 == 42");
        } else if (thisResult == NSOrderedDescending) {
            NSLog(@"27 > 42");
        }
    }
    return 0;
}

