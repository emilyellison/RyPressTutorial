//
//  main.m
//  Protocols
//
//  Created by Emily on 7/9/13.
//  Copyright (c) 2013 RyPress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bicycle.h"
#import "Car.h"
#import "StreetLegal.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // ADOPTING PROTOCOLS
        
        Bicycle *bike = [[Bicycle alloc] init];
        [bike startPedaling];
        [bike signalLeftTurn];
        [bike signalStop];
        [bike startPedaling];
        [bike signalRightTurn];
        [bike signalStop];
        [bike lockToStructure:nil];
        
        id <StreetLegal> mysteryVehicle = [[Car alloc] init];
        [mysteryVehicle signalLeftTurn];
        
        if ([mysteryVehicle conformsToProtocol:@protocol(StreetLegal)]) {
            [mysteryVehicle signalStop];
            [mysteryVehicle signalLeftTurn];
            [mysteryVehicle signalRightTurn];
        }
        
        mysteryVehicle = [[Bicycle alloc] init];
        [mysteryVehicle signalLeftTurn];
        
        if ([mysteryVehicle conformsToProtocol:@protocol(StreetLegal)]) {
            [mysteryVehicle signalStop];
            [mysteryVehicle signalLeftTurn];
            [mysteryVehicle signalRightTurn];
        }
        
    }
    return 0;
}

