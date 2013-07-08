//
//  CarUtilities.h
//  Functions
//
//  Created by Emily on 7/8/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

// FUNCTION LIBRARIES

#import <Foundation/Foundation.h>

// The class CarUtilities inherits from NSObject

NSString *CUGetRandomMake(NSArray *makes);
NSString *CUGetRandomModel(NSArray *models);
NSString *CUGetRandomMakeAndModel(NSDictionary *makesAndModels);
