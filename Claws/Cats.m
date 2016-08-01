//
//  ViewController.m
//  Claws
//
//  Created by Meet Mehta on 4/21/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "Cats.h"

@interface Cats ()

@end

@implementation Cats

// you have to encode and decode the cats too because GameData uses arrays where the cat object is an item in the array. So Cats need to follow the
// the encoding protocol
static NSString* const SSCatsNameKey = @"name123";
static NSString* const SSCatsCurrLoyaltyKey = @"currLoyalty123";
static NSString* const SSCatsMaxLoyaltyKey = @"maxLoyalty123";
static NSString* const SSCatsLoyaltyThresholdKey = @"loyaltyThreshold123";
static NSString* const SSCatsSpecificFoodKey = @"specificFood123";
static NSString* const SSCatsSpecificItemsKey = @"specificItems123";
static NSString* const SSCatsInClanKey = @"inClan123";
static NSString* const SSCatsOnScreenKey = @"OnScreen123";
static NSString* const SSCatsAvailableKey = @"Available123";
static NSString* const SSCatsAssociatedItem = @"associatedItem123";
static NSString* const SSCatsPositionPictures = @"positionPictures123";





- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeObject:self.name forKey: SSCatsNameKey];
    [encoder encodeInt:self.currLoyaltyCounter forKey: SSCatsCurrLoyaltyKey];
    [encoder encodeInt:self.maxLoyalty forKey: SSCatsMaxLoyaltyKey];
    [encoder encodeInt:self.loyaltyThreshold forKey: SSCatsLoyaltyThresholdKey];
    [encoder encodeObject:self.specificFood forKey: SSCatsSpecificFoodKey];
    [encoder encodeObject:self.specificItems forKey: SSCatsSpecificItemsKey];
    [encoder encodeBool:self.inClan forKey:SSCatsInClanKey];
    [encoder encodeBool:self.onScreen forKey:SSCatsOnScreenKey];
    [encoder encodeBool:self.available forKey:SSCatsAvailableKey];
    [encoder encodeObject:self.associatedItem forKey: SSCatsAssociatedItem];
    [encoder encodeObject:self.CatPositionPictures forKey: SSCatsPositionPictures];

    
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _name = [decoder decodeObjectForKey: SSCatsNameKey];
        _currLoyaltyCounter = [decoder decodeIntForKey: SSCatsCurrLoyaltyKey];
        _maxLoyalty = [decoder decodeIntForKey: SSCatsMaxLoyaltyKey];
        _loyaltyThreshold = [decoder decodeIntForKey: SSCatsLoyaltyThresholdKey];
        _specificFood = [decoder decodeObjectForKey: SSCatsSpecificFoodKey];
        _specificItems = [decoder decodeObjectForKey: SSCatsSpecificItemsKey];
        _inClan = [decoder decodeBoolForKey: SSCatsInClanKey];
        _onScreen = [decoder decodeBoolForKey: SSCatsOnScreenKey];
        _available = [decoder decodeBoolForKey: SSCatsAvailableKey];
        _associatedItem = [decoder decodeObjectForKey: SSCatsAssociatedItem];
        _CatPositionPictures = [decoder decodeObjectForKey:SSCatsPositionPictures];
        
    }
    return self;
}

// not needed but was necessary for one part of the testing 
- (id)copyWithZone:(NSZone *)zone {
    Cats *newCat = [[[self class] allocWithZone:zone] init];
    if(newCat) {
        [newCat setName:[self name]];
        [newCat setMaxLoyalty:[self maxLoyalty]];
        [newCat setCurrLoyaltyCounter:[self currLoyaltyCounter]];
        [newCat setSpecificFood:[self specificFood]];
        [newCat setSpecificItems:[self specificItems]];
        [newCat setInClan:[self inClan]];
        [newCat setOnScreen:[self onScreen]];
        [newCat setAvailable:[self available]];

    }
    return newCat;
}



@end
