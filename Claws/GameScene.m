//
//  GameScene.m
//  Claws
//
//  Created by Meet Mehta on 4/21/16.
//  Copyright (c) 2016 nyu.edu. All rights reserved.
//

#import "GameScene.h"
#import "GameViewController.h"
#import "GameData.h"
#import "currentStateGameData.h"
#import "Cats.h"
#import "DecorativeItems.h"
#import "Food.h"


@implementation GameScene{
    SKLabelNode* _numClicks;
    SKLabelNode* _highScore;
}

bool foodInScene = false;

// these values are for position and scaling of the cats and items ont he screen
-(void)didMoveToView:(SKView *)view {
    float catScale = .40;
    float itemScale = .40;
    int itemZPosition = 8;
    int catZPosition = 9;
    
    int catSpatialPositionX1 = 160;
    int catSpatialPositionY1 = 20;
    int itemSpatialPositionX1 = 150;
    int itemSpatialPositionY1 = 30;
    
    int catSpatialPositionX2 = 55;
    int catSpatialPositionY2 = 250;
    int itemSpatialPositionX2 = 90;
    int itemSpatialPositionY2 = 265;
    
    int catSpatialPositionX3 = -80;
    int catSpatialPositionY3 = 80;
    int itemSpatialPositionX3 = -85;
    int itemSpatialPositionY3 = 125;
    
    int catSpatialPositionX4 = -170;
    int catSpatialPositionY4 = -200;
    int itemSpatialPositionX4 = -160;
    int itemSpatialPositionY4 = -170;
    
    
    float foodScale = 0.50;
    int foodZPosition = 10;
    int foodPositionX = 1;
    int foodPositionY = 120;
    
    
    // testing
    [[GameData sharedGameData].testArray removeAllObjects];
    
    // this actually shows the prey points
    _highScore = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
    _highScore.fontSize = 15.0;
    _highScore.position = CGPointMake((CGRectGetMidX(self.frame)-167),
                                      (CGRectGetMidY(self.frame)-365));
    _highScore.fontColor = [SKColor redColor];
    [self addChild:_highScore];
    
    
    
    
    /* This sets up the actual yard where all the items and cats will be palced*/
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"screen2a"];
    back.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    back.zPosition = -1;
    back.xScale = .40;
    back.yScale = .40;
    [self addChild: back];
    

    // testing purposes
    NSArray *keyArray = [currCatsAndPosOnScreen allKeys];
    NSLog (@" How many Cats in currCatsAndPos: %i", [currCatsAndPosOnScreen count]);
    NSArray *allCatsInCurrCatsAndPos = [currCatsAndPosOnScreen allKeys];
    NSLog(@"Which cat in currCatsAndPos: %@", allCatsInCurrCatsAndPos);
    NSLog (@"  How many cats in gameshared data: %i", [[GameData sharedGameData].CatsAndPosOnScreen count]);
    NSArray *allCatsInCatsAndPosOnScreen = [[GameData sharedGameData].CatsAndPosOnScreen allKeys];
    NSLog(@"Which cat in CatsAndPosOnScreen: %@", allCatsInCatsAndPosOnScreen);



    if ([currCatsAndPosOnScreen count] != 0){
        
        NSNumber *positionAssociatedWithCat = currCatsAndPosOnScreen[keyArray [0]];

        NSLog(@ "%@", positionAssociatedWithCat);
        NSLog (@"-----------------------------------------------------------");
        
    }


    

// for each cat that is on the screen, place it in the correct location depending on where its associated item's position is.
    
    for (int qwerty = 0; qwerty < [keyArray count]; qwerty ++){
        int catSpatialPositionX = 0;
        int catSpatialPositionY = 0;
        Cats* actualCatToAdd = [[GameData sharedGameData].allCatsInGame objectForKey:keyArray[qwerty]];
        DecorativeItems *catsAssociatedItem = [[GameData sharedGameData].allItemsInGame objectForKey: actualCatToAdd.associatedItem];
        if ([catsAssociatedItem.itemPosition  isEqual: @1]){
            catSpatialPositionX = catSpatialPositionX1;
            catSpatialPositionY = catSpatialPositionY1;
        }
        
        else if ([catsAssociatedItem.itemPosition  isEqual: @2]){
            catSpatialPositionX = catSpatialPositionX2;
            catSpatialPositionY = catSpatialPositionY2;
        }
        
        else if ([catsAssociatedItem.itemPosition  isEqual: @3]){
            catSpatialPositionX = catSpatialPositionX3;
            catSpatialPositionY = catSpatialPositionY3;
        }
        
        else if ([catsAssociatedItem.itemPosition  isEqual: @4]){
            catSpatialPositionX = catSpatialPositionX4;
            catSpatialPositionY = catSpatialPositionY4;
        }
        
        
        
        NSString *picOfCat = actualCatToAdd.CatPositionPictures[0];
        
        // testing purposes
        NSLog(@ "NAME OF CATTTTTTTTTTTTTTTTTT %@", actualCatToAdd.name); 
        NSLog(@" PICTURE OF CATTTTTTTTTTTTTT, %@", picOfCat);
        
        // actually add the cat sprite in
        SKSpriteNode *catToAdd = [SKSpriteNode spriteNodeWithImageNamed: picOfCat];
        catToAdd.xScale = catScale;
        catToAdd.yScale = catScale;
        catToAdd.zPosition = catZPosition;
        catToAdd.position = CGPointMake((CGRectGetMidX(self.frame) - catSpatialPositionX), (CGRectGetMidY(self.frame)- catSpatialPositionY));
        [self addChild: catToAdd];
    }

    
   NSArray *keyArrayItems = [currItemsAndPosOnScreen allKeys];

    // the next couple of parts are for testing purposes
    NSLog(@"%@", keyArrayItems);
    NSLog (@"How many Items in curritemsAndPos: %i", [currItemsAndPosOnScreen count]);
    NSLog (@"  How many items in gameshared data: %i", [[GameData sharedGameData].ItemsAndPosOnScreen count]);
    
    if ([keyArrayItems count] != 0){
        NSNumber *positionAssociatedWithItem = currItemsAndPosOnScreen[keyArrayItems [0]];
        
        NSLog(@ "%@", positionAssociatedWithItem);
        if ([keyArrayItems count] >= 2){
            NSLog(@ "%@", currItemsAndPosOnScreen[keyArrayItems [1]]);
        }
        NSLog (@"-----------------------------------------------------------");

    }
    
    NSLog (@"Total Cats in Master Array %i", [[GameData sharedGameData].allCatsInGame count]);
    NSArray *catsNames = [[GameData sharedGameData].allCatsInGame allKeys];
    NSLog(@"%@", catsNames);
    for (int abcd = 0; abcd<[catsNames count]; abcd++){
        Cats *checkCatAssociatedItem = [[GameData sharedGameData].allCatsInGame objectForKey:catsNames[abcd]];
        NSLog (@"The cat is %@ and it's associated item is %@", checkCatAssociatedItem.name, checkCatAssociatedItem.associatedItem);
    }
    Cats *checkThisCatOut = [[GameData sharedGameData].allCatsInGame objectForKey:catsNames[1]];
    NSLog (@" This Cat's Name is %@ and its current loyalty is  %i", checkThisCatOut.name, checkThisCatOut.currLoyaltyCounter);
    NSLog (@"-----------------------------------------------------------");

    


    
    // actually place the items on the screen.
    
    for (int dsw = 0; dsw < [keyArrayItems count]; dsw ++){
        int itemPositionX = 0;
        int itemPositionY = 0;
        DecorativeItems* actualItemToAdd = [[GameData sharedGameData].allItemsInGame objectForKey:keyArrayItems[dsw]];
        
        if ([actualItemToAdd.itemPosition isEqual: @1]){
            itemPositionX = itemSpatialPositionX1;
            itemPositionY = itemSpatialPositionY1;
        }
        
        else if ([actualItemToAdd.itemPosition isEqual: @2]){
            itemPositionX = itemSpatialPositionX2;
            itemPositionY = itemSpatialPositionY2;
        }
        
        else if ([actualItemToAdd.itemPosition isEqual: @3]){
            itemPositionX = itemSpatialPositionX3;
            itemPositionY = itemSpatialPositionY3;
        }
        
        else if ([actualItemToAdd.itemPosition isEqual: @4]){
            itemPositionX = itemSpatialPositionX4;
            itemPositionY = itemSpatialPositionY4;
        }
        
        SKSpriteNode *itemToAdd = [SKSpriteNode spriteNodeWithImageNamed: actualItemToAdd.picture];
        itemToAdd.xScale = itemScale;
        itemToAdd.yScale = itemScale;
        itemToAdd.zPosition = itemZPosition;
        itemToAdd.position = CGPointMake((CGRectGetMidX(self.frame) - itemPositionX), (CGRectGetMidY(self.frame)- itemPositionY));
        [self addChild: itemToAdd];
    }
    
    
    
    //ADDING FOOD ------------------------------------------------------------------------------
    NSArray *keyArrayFoods = [[GameData sharedGameData].allFoodInGame allKeys];
    NSLog(@"%@", keyArrayFoods);
    NSString *foodNameAdd = [GameData sharedGameData].foodToAdd;
    Food *checkFoodAdd = [[GameData sharedGameData].allFoodInGame objectForKey:foodNameAdd];
    NSLog(@"%@", checkFoodAdd.name);
    //Then add the food to the scene (we already know that it's been selected to be displayed due to the AddFoodScreen
    SKSpriteNode *foodToAdd = [SKSpriteNode spriteNodeWithImageNamed: checkFoodAdd.foodPic];
    foodToAdd.xScale = foodScale;
    foodToAdd.yScale = foodScale;
    foodToAdd.zPosition = foodZPosition;
    foodToAdd.position = CGPointMake((CGRectGetMidX(self.frame)-foodPositionX),(CGRectGetMidY(self.frame)-foodPositionY));
    [self addChild: foodToAdd];

    
    //---------------------------------------------------------------------------------

    
    
    // add the prey points on to the screen
    _highScore.text = [NSString stringWithFormat:@"Prey Points: %i pt", [GameData sharedGameData].preyPoints];
    //_numClicks.text = @"0 clicks";
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

// save gameData each frame
-(void)update:(CFTimeInterval)currentTime {
    _highScore.text = [NSString stringWithFormat:@"Prey Points: %i pt", [GameData sharedGameData].preyPoints];
    [[GameData sharedGameData] save];


    /* Called before each frame is rendered */
}




@end
