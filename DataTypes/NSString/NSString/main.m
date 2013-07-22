//
//  main.m
//  NSString
//
//  Created by Emily on 7/22/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // CREATING STRINGS
        
        NSString *make = @"Porshce";
        NSString *model = @"911";
        
        int year = 1968;
        NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d", make, model, year];
        NSLog(@"%@", message);
        
        // ENUMERATING STRINGS
        
        NSString *make2 = @"Porsche";
        for (int i = 0; i<[make2 length]; i++) {
            unichar letter = [make2 characterAtIndex:1];
            NSLog(@"%d: %hu", i, letter);
        }
        
        // COMPARING STRINGS
        
        NSString *car = @"Porsche Boxster";
        if ([car isEqualToString:@"Porsche Boxster"]) {
            NSLog(@"That car is a Porsche Boxster");
        }
        if ([car hasPrefix:@"Porsche"]) {
            NSLog(@"That car is a Porsche of some sort");
        }
        if ([car hasSuffix:@"Carrera"]) {
            NSLog(@"That car is a Carrera");
        }
        
        NSString *otherCar = @"Ferrari";
        NSComparisonResult result = [car compare: otherCar];
        if (result == NSOrderedAscending) {
            NSLog(@"The letter 'P' comes before 'F'");
        } else if (result == NSOrderedSame) {
            NSLog(@"We're comparing the same string");
        } else if (result == NSOrderedDescending) {
            NSLog(@"The letter 'P' comes after 'F'");
        }
        
        // COMBINING STRINGS
        
        NSString *make3 = @"Ferrari";
        NSString *model3 = @"458 Spider";
        NSString *car3 = [make3 stringByAppendingString:model3];
        NSLog(@"%@", car3);
        car3 = [make3 stringByAppendingFormat:@" %@", model3];
        NSLog(@"%@", car3);
        
        // SEARCHING STRINGS
        
        NSString *car4 = @"Maserati GranCabrio";
        NSRange searchResult = [car4 rangeOfString:@"Cabrio"];
        if (searchResult.location == NSNotFound) {
            NSLog(@"Search string was not found");
        } else {
            NSLog(@"Cabrio starts an index %lu and is %lu characters long", searchResult.location, searchResult.length);
        }
        
        // SUBDIVIDING STRINGS
        
        NSString *car5 = @"Maserati GranTurismo";
        NSLog(@"%@", [car5 substringToIndex:8]);
        NSLog(@"%@", [car5 substringFromIndex:9]);
        NSRange range = NSMakeRange(9, 4);
        NSLog(@"%@", [car5 substringWithRange:range]);
        
        NSString *models = @"Porsche,Ferrari,Maserati";
        NSArray *modelsAsArray = [models componentsSeparatedByString:@","];
        NSLog(@"%@", [modelsAsArray objectAtIndex:1]);
        
        // REPLACING SUBSTRINGS
        
        NSString *elise = @"Lotus Elise";
        NSRange range2 = NSMakeRange(6, 5);
        NSString *exige = [elise stringByReplacingCharactersInRange:range2 withString:@"Exige"];
        NSLog(@"%@", exige);
        NSString *evora = [exige stringByReplacingOccurrencesOfString:@"Exige" withString:@"Evora"];
        NSLog(@"%@", evora);
        
        // CHANGING CASE
        
        NSString *car6 = @"lotUs beSpoKe";
        NSLog(@"%@", [car6 lowercaseString]);
        NSLog(@"%@", [car6 uppercaseString]);
        NSLog(@"%@", [car6 capitalizedString]);
        
        // NUMERICAL CONVERSIONS
        
        NSString *year2 = @"2012";
        BOOL asBool = [year2 boolValue];
        int asInt = [year2 intValue];
        NSInteger asInteger = [year2 integerValue];
        long long asLongLong = [year2 longLongValue];
        float asFloat = [year2 floatValue];
        double asDouble = [year2 doubleValue];

        // NSMUTABLE STRING

        // The NSMutableString class is a mutable version of NSString.
        // Unlike immutable strings, it’s possible to alter individual
        // characters of a mutable string without creating a brand new
        // object. This makes NSMutableString the preferred data structure
        // when you’re performing several small edits on the same string.
        
        NSMutableString *car7 = [NSMutableString stringWithString:@"Porsche 911"];
        [car7 setString:@"Porsche Boxster"];
        
        // EXPANDING MUTABLE STRINGS
        
        NSMutableString *car8 = [NSMutableString stringWithCapacity:20];
        NSString *model8 = @"458 Spider";
        
        [car8 setString:@"Ferrari"];
        [car8 appendString:model8];
        NSLog(@"%@", car8);
        
        [car8 setString:@"Ferrari"];
        [car8 appendFormat:@" %@", model8];
        NSLog(@"%@", car8);
        
        [car8 setString:@"Ferrari Spider"];
        [car8 insertString:@"458 " atIndex:8];
        NSLog(@"%@", car8);
        
        // REPLACING/DELETING SUBSTRINGS
        
        NSMutableString *car9 = [NSMutableString stringWithCapacity:20];
        [car9 setString:@"Lotus Elise"];
        [car9 replaceCharactersInRange:NSMakeRange(6, 5) withString:@"Exige"];
        NSLog(@"%@", car9);
        [car9 deleteCharactersInRange:NSMakeRange(5, 6)];
        NSLog(@"%@", car9);
        
        // WHEN TO USE MUTABLE STRINGS
        
        // DO NOT DO THIS. EVER.
        // NSString *indices = @"";
        // for (int i=0; i<1000; i++) {
        //     indices = [indices stringByAppendingFormat:@"%d", i];
        // }
        
        NSMutableString *indices = [NSMutableString stringWithCapacity:1];
        for (int i=0; i<1000; i++) {
            [indices appendFormat:@"%d", i];
        }
        

    }
    return 0;
}

