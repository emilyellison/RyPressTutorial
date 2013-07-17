//
//  main.m
//  NSDecimalNumber
//
//  Created by Emily on 7/17/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // NSDECIMALNUMBER
        
        NSDecimalNumber *price;
        price = [NSDecimalNumber decimalNumberWithString:@"15.99"];
        NSLog(@"The price is: %@", price);
        
        // ARITHMETIC
        
        NSDecimalNumber *price1 = [NSDecimalNumber decimalNumberWithString:@"15.99"];
        NSDecimalNumber *price2 = [NSDecimalNumber decimalNumberWithString:@"29.99"];
        NSDecimalNumber *coupon = [NSDecimalNumber decimalNumberWithString:@"5.00"];
        NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@".90"];
        NSDecimalNumber *numProducts = [NSDecimalNumber decimalNumberWithString:@"2.0"];
        
        NSDecimalNumber *subtotal = [price1 decimalNumberByAdding:price2];
        NSDecimalNumber *afterCoupon = [subtotal decimalNumberBySubtracting:coupon];
        NSDecimalNumber *afterDiscount = [afterCoupon decimalNumberByMultiplyingBy:discount];
        NSDecimalNumber *average = [afterDiscount decimalNumberByDividingBy:numProducts];
        NSDecimalNumber *averageSquared = [average decimalNumberByRaisingToPower:2];
        
        NSLog(@"Subtotal: %@", subtotal);                    // 45.98
        NSLog(@"After coupon: %@", afterCoupon);           // 40.98
        NSLog((@"After discount: %@"), afterDiscount);       // 36.882
        NSLog(@"Average price per product: %@", average);    // 18.441
        NSLog(@"Average price squared: %@", averageSquared); // 340.070481
        
        // ROUNDING BEHAVIOR
        
        // The NSRoundUp argument makes all operations round up to the nearest
        // place. Other rounding options are NSRoundPlain, NSRoundDown, and
        // NSRoundBankers
        
        // The scale: parameter defines the number of decimal places the resulting
        // value should have, and the rest of the parameters define the
        // exception-handling behavior of any operations.
        
        NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                           decimalNumberHandlerWithRoundingMode:NSRoundUp
                                           scale:2
                                           raiseOnExactness:NO
                                           raiseOnOverflow:NO
                                           raiseOnUnderflow:NO
                                           raiseOnDivideByZero:YES];
        
        NSDecimalNumber *aDifferentTotal = [subtotal decimalNumberByMultiplyingBy:discount
                                                           withBehavior:roundUp];
        NSLog(@"Rounded total: %@", aDifferentTotal);
        
        // COMPARING NSDECIMAL NUMBERS
        
        NSDecimalNumber *discount1 = [NSDecimalNumber decimalNumberWithString:@".85"];
        NSDecimalNumber *discount2 = [NSDecimalNumber decimalNumberWithString:@".9"];
        NSComparisonResult result = [discount1 compare:discount2];
        if (result == NSOrderedAscending) {
            NSLog(@"85%% < 90%%");
        } else if (result == NSOrderedSame) {
            NSLog(@"85%% == 90%%");
        } else if (result == NSOrderedDescending) {
            NSLog(@"85%% > 90%%");
        }
        
        // NSDECIMAL
        
        // Instead of an NSDecimalNumber object, the C interface is built around
        // the NSDecimal struct. Unfortunately, the Foundation Framework doesn’t
        // make it easy to create an NSDecimal from scratch. You need to generate
        // one from a full-fledged NSDecimalNumber using its decimalValue method.
        
        NSDecimalNumber *newPrice = [NSDecimalNumber decimalNumberWithString:@"15.99"];
        NSDecimal asStruct = [newPrice decimalValue];
        NSDecimalNumber *asNewObject = [NSDecimalNumber decimalNumberWithDecimal:asStruct];
        
        // ARITHMETIC
        
        NSDecimal price1Dec = [[NSDecimalNumber decimalNumberWithString:@"15.99"] decimalValue];
        NSDecimal price2Dec = [[NSDecimalNumber decimalNumberWithString:@"29.99"] decimalValue];
        NSDecimal couponDec = [[NSDecimalNumber decimalNumberWithString:@"5.00"] decimalValue];
        NSDecimal discountDec = [[NSDecimalNumber decimalNumberWithString:@".90"] decimalValue];
        NSDecimal numProductsDec = [[NSDecimalNumber decimalNumberWithString:@"2.0"] decimalValue];
        NSLocale *locale = [NSLocale currentLocale];
        NSDecimal resultDec;
        
        NSDecimalAdd(&resultDec, &price1Dec, &price2Dec, NSRoundUp);
        NSLog(@"Subtotal: %@", NSDecimalString(&resultDec, locale));
        NSDecimalSubtract(&resultDec, &resultDec, &couponDec, NSRoundUp);
        NSLog(@"After coupon: %@", NSDecimalString(&resultDec, locale));
        NSDecimalMultiply(&resultDec, &resultDec, &discountDec, NSRoundUp);
        NSLog(@"After discount: %@", NSDecimalString(&resultDec, locale));
        NSDecimalDivide(&resultDec, &resultDec, &numProductsDec, NSRoundUp);
        NSLog(@"Average price per product: %@", NSDecimalString(&resultDec, locale));
        NSDecimalPower(&resultDec, &resultDec, 2, NSRoundUp);
        NSLog(@"Average price squared: %@", NSDecimalString(&resultDec, locale));

        // ERROR CHECKING
        
        NSDecimal a = [[NSDecimalNumber decimalNumberWithString:@"1.0"] decimalValue];
        NSDecimal b = [[NSDecimalNumber decimalNumberWithString:@"0.0"] decimalValue];
        NSDecimal resultError;
        NSCalculationError success = NSDecimalDivide(&resultError, &a, &b, NSRoundPlain);
        switch (success) {
            case NSCalculationNoError:
                NSLog(@"Operation successful");
                break;
            case NSCalculationLossOfPrecision:
                NSLog(@"Error: Operation resulted in loss of precision");
                break;
            case NSCalculationUnderflow:
                NSLog(@"Error: Operation resulted in underflow");
                break;
            case NSCalculationOverflow:
                NSLog(@"Error: Operation resulted in overflow");
                break;
            case NSCalculationDivideByZero:
                NSLog(@"Error: Tried to divide by zero");
                break;
            default:
                break;
        }
        
        // COMPARING NSDECIMALS
        
        NSDecimal discount1Dec = [[NSDecimalNumber decimalNumberWithString:@".85"] decimalValue];
        NSDecimal discount2Dec = [[NSDecimalNumber decimalNumberWithString:@".9"] decimalValue];
        NSComparisonResult resultCompDec = NSDecimalCompare(&discount1Dec, &discount2Dec);
        if (resultCompDec == NSOrderedAscending) {
            NSLog(@"85%% < 90%%");
        } else if (resultCompDec == NSOrderedSame) {
            NSLog(@"85%% == 90%%");
        } else if (resultCompDec == NSOrderedDescending) {
            NSLog(@"85%% > 90%%");
        }

    }
    return 0;
}

