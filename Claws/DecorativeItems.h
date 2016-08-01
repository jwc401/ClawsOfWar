//
//  DecorativeItems.h
//  Claws
//
//  Created by Jonathan Chua on 4/30/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// properties for the decorative items
@interface DecorativeItems : NSObject <NSCoding>

@property (assign, nonatomic) int cost; //Cost of the decoration
@property (assign, nonatomic) BOOL isBeingUsed; //If the decoration is being used
@property (assign, nonatomic) BOOL isBought; //If the item was bought
@property (assign, nonatomic) BOOL isOnScreen; //If the item is already on the screen
@property (strong, nonatomic) NSNumber *itemPosition; //Position of the item (between 1-5)
@property (strong, nonatomic) NSString *associatedCat; //Cat associated with the item. For future interaction with cat spawn chance
@property (strong, nonatomic) NSString *itemName; //Name of the decoration
@property (strong, nonatomic) NSString *positionOfCat; //Position of the cat. For future interaction with cat artwork
@property (strong, nonatomic) NSString *picture; //Picture of the decoration



@end
