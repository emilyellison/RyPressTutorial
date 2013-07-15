//
//  CarStore.h
//  MemoryMgmt
//
//  Created by Emily on 7/15/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarStore : NSObject

- (NSMutableArray *)inventory;
- (void)setInventory:(NSMutableArray *)newInventory;
+ (CarStore *)carStore;

@end
