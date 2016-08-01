//
//  currentStateGameData.h
//  Claws
//
//  Created by Meet Mehta on 4/24/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface currentStateGameData : NSObject

// this is the data at the beginning of the current launch! Very important to remember. This does not change within a launch
// I made all the variables truly global so they canbe accessed from every other file. 
@property (assign, nonatomic) int highScoreWhenAppOpened;

extern int highScore1;
extern NSMutableDictionary *currCatsAndPosOnScreen;
extern NSMutableDictionary *currItemsAndPosOnScreen;
extern NSMutableDictionary *currFoodsAndPosOnScreen;
extern bool food1;


@end
