//
//  Food.m
//  Claws
//
//  Created by Jonathan Chua on 5/12/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Used for the food objects and their properties

#import "Food.h"

@implementation Food

// making sure the food properties are properly saved
static NSString* const SSName = @"Name456";
static NSString* const SSFoodCost= @"cost456";
static NSString* const SSFoodAmountLeft = @"foodAmountLeft456";
static NSString* const SSFoodDuration = @"foodDuration456";
static NSString* const SSFoodPositionOfItem = @"positionFood456";
static NSString* const SSFoodPicture = @"pictureFood456";
static NSString* const SSFoodPositionCat = @"positionCat456";
static NSString* const SSFoodAssociatedCat = @"associatedCat456";
static NSString* const SSFoodBeingUsed = @"beingUsed456";
static NSString* const SSFoodBought = @"FoodBought456";
static NSString* const SSFoodOnScreen = @"OnScreen456";


- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeObject:self.name forKey: SSName];
    [encoder encodeInt:self.cost forKey: SSFoodCost];
    [encoder encodeInt:self.amountLeft forKey: SSFoodAmountLeft];
    [encoder encodeInt:self.duration forKey: SSFoodDuration];
    [encoder encodeObject:self.foodPosition forKey: SSFoodPositionOfItem];
    [encoder encodeObject:self.foodPic forKey:SSFoodPicture];
    [encoder encodeObject:self.positionOfCat forKey: SSFoodPositionCat];
    [encoder encodeObject:self.associatedCat forKey: SSFoodAssociatedCat];
    [encoder encodeBool:self.isBeingUsed forKey: SSFoodBeingUsed];
    [encoder encodeBool: self.isBought forKey: SSFoodBought];
    [encoder encodeBool:self.isOnScreen forKey: SSFoodOnScreen];
}


- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        
        _name = [decoder decodeObjectForKey:SSName];
        _cost = [decoder decodeIntForKey: SSFoodCost];
        _amountLeft = [decoder decodeIntForKey: SSFoodAmountLeft];
        _duration = [decoder decodeIntForKey: SSFoodDuration];
        _foodPosition = [decoder decodeObjectForKey:SSFoodPositionOfItem];
        _foodPic = [decoder decodeObjectForKey: SSFoodPicture];
        _positionOfCat = [decoder decodeObjectForKey:SSFoodPositionCat];
        _associatedCat = [decoder decodeObjectForKey:SSFoodAssociatedCat];
        _isBeingUsed = [decoder decodeBoolForKey: SSFoodBeingUsed];
        _isBought = [decoder decodeBoolForKey: SSFoodBought];
        _isOnScreen = [decoder decodeBoolForKey: SSFoodOnScreen];
        
    }
    return self;
}

@end

