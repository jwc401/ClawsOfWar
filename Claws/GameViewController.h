//
//  GameViewController.h
//  Claws
//

//  Copyright (c) 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "GameData.h"

@interface GameViewController : UIViewController{
@public
    int displayScore1;
    
}

// this is needed because we need to be able to grab an intem from the inventory and place it on the main game scene
@property (strong, nonatomic) NSMutableArray *myMutableArray;
@property (nonatomic) int displayScore;
@property (strong, nonatomic) NSString *itemToAddFromInventory;
@property (strong, nonatomic) NSString *foodToAddFromInventory;





NSMutableArray *getMyMutableArray();
int getDisplayScore(); 

@end
