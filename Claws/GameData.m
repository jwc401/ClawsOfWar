//
//  GameData.m
//  Claws
//
//  Created by Meet Mehta on 4/23/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "GameData.h"

@implementation GameData

// this is how the game data is "saved"....you encode the data when you save it, decode it when you need it, and save it to a file.
// Got a lot of help from : https://www.raywenderlich.com/63235/how-to-save-your-game-data-tutorial-part-1-of-2

static NSString* const SSGameDataHighScoreKey = @"highScore";
static NSString* const SSGameDataTotalTestArray = @"totalTestArray";
static NSString* const SSGameDataCatsOnScreen = @"catsOnScreen1";
static NSString* const SSGameDataItemsOnScreen = @"itemsOnScreen1";
static NSString* const SSGameDataAllCatsInGame = @"allCatsInGame";
static NSString* const SSGameDataAllItemsInGame = @"allItemsInGame";
static NSString* const SSGameDataPreyPoints = @"preyPoints";
static NSString* const SSGameDataAllFoodInGame = @"allFoodInGame";
static NSString* const SSGameDataFoodsOnScreen = @"foodsOnScreen1";
static NSString* const SSGameDataFoodToAdd = @"foodToAdd";


- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInt:self.highScore forKey: SSGameDataHighScoreKey];
    [encoder encodeObject:self.testArray forKey:SSGameDataTotalTestArray];
    [encoder encodeObject: self.CatsAndPosOnScreen forKey: SSGameDataCatsOnScreen];
    [encoder encodeObject:self.ItemsAndPosOnScreen forKey:SSGameDataItemsOnScreen];
    [encoder encodeObject:self.allCatsInGame forKey:SSGameDataAllCatsInGame];
    [encoder encodeObject:self.allItemsInGame forKey:SSGameDataAllItemsInGame];
    [encoder encodeInt: self.preyPoints forKey: SSGameDataPreyPoints];
    [encoder encodeObject:self.FoodAndPosOnScreen forKey: SSGameDataFoodsOnScreen];
    [encoder encodeObject:self.allFoodInGame forKey: SSGameDataAllFoodInGame];
    [encoder encodeObject:self.foodToAdd forKey:SSGameDataFoodToAdd];
}


- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        _highScore = [decoder decodeIntForKey: SSGameDataHighScoreKey];
        _testArray = [decoder decodeObjectForKey: SSGameDataTotalTestArray];
        _CatsAndPosOnScreen = [decoder decodeObjectForKey: SSGameDataCatsOnScreen];
        _ItemsAndPosOnScreen = [decoder decodeObjectForKey: SSGameDataItemsOnScreen];
        _allCatsInGame = [decoder decodeObjectForKey: SSGameDataAllCatsInGame];
        _allItemsInGame = [decoder decodeObjectForKey: SSGameDataAllItemsInGame];
        _preyPoints = [decoder decodeIntForKey: SSGameDataPreyPoints];
        _allFoodInGame = [decoder decodeObjectForKey: SSGameDataAllFoodInGame];
        _FoodAndPosOnScreen = [decoder decodeObjectForKey: SSGameDataFoodsOnScreen];
        _foodToAdd = [decoder decodeObjectForKey:SSGameDataFoodToAdd];
    }
    return self;
}

// file path where the game data is saved
+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

// load game data
+(instancetype)loadInstance
{
    NSData* decodedData = [NSData dataWithContentsOfFile: [GameData filePath]];
    if (decodedData) {
        GameData* gameData = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return gameData;
    }
    
    return [[GameData alloc] init];
}

// save game data
-(void)save
{
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[GameData filePath] atomically:YES];
}




// make sure game data can be accessed by all files and that all the game data is the same.
+ (instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self loadInstance];
    });
    
    return sharedInstance;
}

-(void)reset
{
    self.numClicks = 0;
}


@end
