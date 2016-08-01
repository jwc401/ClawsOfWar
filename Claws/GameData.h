//
//  GameData.h
//  Claws
//
//  Created by Meet Mehta on 4/23/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

// this is all the game data that needs to persist through different launches

@property (strong, nonatomic) NSMutableDictionary *ItemsAndPosOnScreen;
@property (strong, nonatomic) NSMutableDictionary *CatsAndPosOnScreen;
@property (strong, nonatomic) NSMutableArray *testArray;
@property (strong, nonatomic) NSMutableDictionary *allCatsInGame;
@property (strong, nonatomic) NSMutableDictionary *allItemsInGame;
@property (assign, nonatomic) int numClicks; /////// for testing purposes
@property (assign, nonatomic) int highScore; /////// for testing purposes
@property (assign, nonatomic) bool isFood;
@property (assign, nonatomic) int preyPoints;

@property (strong, nonatomic) NSMutableDictionary *allFoodInGame;
@property (strong, nonatomic) NSMutableDictionary *FoodAndPosOnScreen;
@property (strong, nonatomic) NSString *foodToAdd;





+(instancetype)sharedGameData;
-(void)reset;
-(void)save; 

@end
