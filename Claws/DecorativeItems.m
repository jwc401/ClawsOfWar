//
//  DecorativeItems.m
//  Claws
//
//  Created by Jonathan Chua on 4/30/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Used for the decoration objects and their properties

#import "DecorativeItems.h"

@implementation DecorativeItems

// making sure that the decorative items are properly saved

static NSString* const SSItemsCost = @"cost456";
static NSString* const SSItemBeingUsed = @"beingUsed456";
static NSString* const SSItemBought = @"ItemBought456";
static NSString* const SSItemOnScreen = @"OnScreen456";
static NSString* const SSItemAssociatedCat = @"associatedCat456";
static NSString* const SSItemName = @"itemName456";
static NSString* const SSItemPositionCat = @"positionCat456";
static NSString* const SSItemPositionOfItem = @"positionItem456";
static NSString* const SSItemPicture = @"pictureItem456";






- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeInt:self.cost forKey: SSItemsCost];
    [encoder encodeBool:self.isBeingUsed forKey: SSItemBeingUsed];
    [encoder encodeBool: self.isBought forKey: SSItemBought];
    [encoder encodeBool:self.isOnScreen forKey: SSItemOnScreen];
    [encoder encodeObject:self.associatedCat forKey: SSItemAssociatedCat];
    [encoder encodeObject:self.itemName forKey: SSItemName];
    [encoder encodeObject:self.positionOfCat forKey: SSItemPositionCat];
    [encoder encodeObject:self.itemPosition forKey: SSItemPositionOfItem];
    [encoder encodeObject:self.picture forKey:SSItemPicture];



    
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _cost = [decoder decodeIntForKey: SSItemsCost];
        _isBeingUsed = [decoder decodeBoolForKey: SSItemBeingUsed];
        _isBought = [decoder decodeBoolForKey: SSItemBought];
        _isOnScreen = [decoder decodeBoolForKey: SSItemOnScreen];
        _associatedCat = [decoder decodeObjectForKey:SSItemAssociatedCat];
        _itemName = [decoder decodeObjectForKey:SSItemName];
        _positionOfCat = [decoder decodeObjectForKey:SSItemPositionCat];
        _itemPosition = [decoder decodeObjectForKey:SSItemPositionOfItem];
        _picture = [decoder decodeObjectForKey: SSItemPicture]; 


    }
    return self;
}



@end
