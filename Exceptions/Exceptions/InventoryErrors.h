//
//  InventoryErrors.h
//  Exceptions
//
//  Created by Emily on 7/14/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *InventoryErrorDomain = @"com.Rypress.Inventory.ErrorDomain";

enum {
    InventoryNotLoadedError,
    InventoryEmptyError,
    InventoryInternalError
};
