//
//  Food.h
//  Claws
//
//  Created by Jonathan Chua on 5/12/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// properties for the food
@interface Food : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name; //The name of the food
@property (assign, nonatomic) int cost; //The cost (in prey points) of the food
@property (assign, nonatomic) int amountLeft; //The amount of food left. Will be used in future builds to entice the player to keep playing
@property (assign, nonatomic) int duration; //Duration of the food left (time). Will be used in the future
@property (strong, nonatomic) NSNumber *foodPosition; //Postion of this food. For future artwork integration
@property (strong, nonatomic) NSString *foodPic; //Picture of the food in question
@property (strong, nonatomic) NSString *positionOfCat; //Position of cat with the food. For future artwork integration
@property (strong, nonatomic) NSString *associatedCat; //Checks the cat associated with it. For future interactions with loyalty
@property (assign, nonatomic) BOOL isBeingUsed; //Checks if it's already being used
@property (assign, nonatomic) BOOL isBought; //Checks if it's already being bought
@property (assign, nonatomic) BOOL isOnScreen; //Checks if it is already on screen


@end