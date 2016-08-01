//
//  StartViewController.m
//  Claws
//
//  Created by Meet Mehta on 4/24/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "StartViewController.h"
#import "GameViewController.h"
#import "GameData.h"
#import "currentStateGameData.h"
#import "Cats.h"
#import "DecorativeItems.h"
#import "Food.h"


@interface StartViewController ()

@end

@implementation StartViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
// intialize master cat dictionary if it hasn't been created yet (it will be created during your first run of the game)
    // you also start out with an initial 100 prey points
    if (!([GameData sharedGameData].allCatsInGame)){
        
        [GameData sharedGameData].allCatsInGame = [[NSMutableDictionary alloc] init];
        [GameData sharedGameData].preyPoints = 100;
        
        // each cat has a name, loyalty counter, loyalty threshold (to be in your clan [for future implementation]), max loyalty, specific food and items it needs to be on the screen (for future), inClan boolean, onScreen boolean, and its picture...each cat also has an associated item variable (initalized at the very bottom of this block)
        Cats *Birch = [[Cats alloc] init];
        Birch.name = @"Birch";
        Birch.currLoyaltyCounter = 10;
        Birch.loyaltyThreshold = 15;
        Birch.maxLoyalty = 25;
        Birch.specificFood = [[NSMutableArray alloc] init];
        Birch.specificItems = [[NSMutableArray alloc] init];
        Birch.inClan = false;
        Birch.onScreen = false;
        Birch.CatPositionPictures = [[NSMutableArray alloc]init];
        [Birch.CatPositionPictures addObject:@"birch-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Birch forKey:@"Birch"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Maple = [[Cats alloc] init];
        Maple.name = @"Maple";
        Maple.currLoyaltyCounter = 10;
        Maple.loyaltyThreshold = 25;
        Maple.maxLoyalty = 35;
        Maple.specificFood = [[NSMutableArray alloc] init];
        Maple.specificItems = [[NSMutableArray alloc] init];
        Maple.inClan = false;
        Maple.onScreen = false;
        Maple.CatPositionPictures = [[NSMutableArray alloc]init];
        [Maple.CatPositionPictures addObject:@"maple-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Maple forKey:@"Maple"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Rowan = [[Cats alloc] init];
        Rowan.name = @"Rowan";
        Rowan.currLoyaltyCounter = 10;
        Rowan.loyaltyThreshold = 30;
        Rowan.maxLoyalty = 45;
        Rowan.specificFood = [[NSMutableArray alloc] init];
        Rowan.specificItems = [[NSMutableArray alloc] init];
        Rowan.inClan = false;
        Rowan.onScreen = false;
        Rowan.CatPositionPictures = [[NSMutableArray alloc]init];
        [Rowan.CatPositionPictures addObject:@"rowan-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Rowan forKey:@"Rowan"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Lizard = [[Cats alloc] init];
        Lizard.name = @"Lizard";
        Lizard.currLoyaltyCounter = 10;
        Lizard.loyaltyThreshold = 25;
        Lizard.maxLoyalty = 35;
        Lizard.specificFood = [[NSMutableArray alloc] init];
        Lizard.specificItems = [[NSMutableArray alloc] init];
        Lizard.inClan = false;
        Lizard.onScreen = false;
        Lizard.CatPositionPictures = [[NSMutableArray alloc]init];
        [Lizard.CatPositionPictures addObject:@"lizard-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Lizard forKey:@"Lizard"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Cloud = [[Cats alloc] init];
        Cloud.name = @"Cloud";
        Cloud.currLoyaltyCounter = 10;
        Cloud.loyaltyThreshold = 17;
        Cloud.maxLoyalty = 22;
        Cloud.specificFood = [[NSMutableArray alloc] init];
        Cloud.specificItems = [[NSMutableArray alloc] init];
        Cloud.inClan = false;
        Cloud.onScreen = false;
        Cloud.CatPositionPictures = [[NSMutableArray alloc]init];
        [Cloud.CatPositionPictures addObject:@"cloud-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Cloud forKey:@"Cloud"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Pebble = [[Cats alloc] init];
        Pebble.name = @"Pebble";
        Pebble.currLoyaltyCounter = 10;
        Pebble.loyaltyThreshold = 40;
        Pebble.maxLoyalty = 45;
        Pebble.specificFood = [[NSMutableArray alloc] init];
        Pebble.specificItems = [[NSMutableArray alloc] init];
        Pebble.inClan = false;
        Pebble.onScreen = false;
        Pebble.CatPositionPictures = [[NSMutableArray alloc]init];
        [Pebble.CatPositionPictures addObject:@"pebble-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Pebble forKey:@"Pebble"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Sparrow = [[Cats alloc] init];
        Sparrow.name = @"Sparrow";
        Sparrow.currLoyaltyCounter = 10;
        Sparrow.loyaltyThreshold = 30;
        Sparrow.maxLoyalty = 33;
        Sparrow.specificFood = [[NSMutableArray alloc] init];
        Sparrow.specificItems = [[NSMutableArray alloc] init];
        Sparrow.inClan = false;
        Sparrow.onScreen = false;
        Sparrow.CatPositionPictures = [[NSMutableArray alloc]init];
        [Sparrow.CatPositionPictures addObject:@"sparrow-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Sparrow forKey:@"Sparrow"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Lily = [[Cats alloc] init];
        Lily.name = @"Lily";
        Lily.currLoyaltyCounter = 10;
        Lily.loyaltyThreshold = 35;
        Lily.maxLoyalty = 40;
        Lily.specificFood = [[NSMutableArray alloc] init];
        Lily.specificItems = [[NSMutableArray alloc] init];
        Lily.inClan = false;
        Lily.onScreen = false;
        Lily.CatPositionPictures = [[NSMutableArray alloc]init];
        [Lily.CatPositionPictures addObject:@"lily-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Lily forKey:@"Lily"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Cinder = [[Cats alloc] init];
        Cinder.name = @"Cinder";
        Cinder.currLoyaltyCounter = 10;
        Cinder.loyaltyThreshold = 27;
        Cinder.maxLoyalty = 35;
        Cinder.specificFood = [[NSMutableArray alloc] init];
        Cinder.specificItems = [[NSMutableArray alloc] init];
        Cinder.inClan = false;
        Cinder.onScreen = false;
        Cinder.CatPositionPictures = [[NSMutableArray alloc]init];
        [Cinder.CatPositionPictures addObject:@"cinder-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Cinder forKey:@"Cinder"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Cooper = [[Cats alloc] init];
        Cooper.name = @"Cooper";
        Cooper.currLoyaltyCounter = 10;
        Cooper.loyaltyThreshold = 40;
        Cooper.maxLoyalty = 50;
        Cooper.specificFood = [[NSMutableArray alloc] init];
        Cooper.specificItems = [[NSMutableArray alloc] init];
        Cooper.inClan = false;
        Cooper.onScreen = false;
        Cooper.CatPositionPictures = [[NSMutableArray alloc]init];
        [Cooper.CatPositionPictures addObject:@"cooper-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Cooper forKey:@"Cooper"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Oak = [[Cats alloc] init];
        Oak.name = @"Oak";
        Oak.currLoyaltyCounter = 10;
        Oak.loyaltyThreshold = 20;
        Oak.maxLoyalty = 35;
        Oak.specificFood = [[NSMutableArray alloc] init];
        Oak.specificItems = [[NSMutableArray alloc] init];
        Oak.inClan = false;
        Oak.onScreen = false;
        Oak.CatPositionPictures = [[NSMutableArray alloc]init];
        [Oak.CatPositionPictures addObject:@"oak-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Oak forKey:@"Oak"];
        ////////////////////////////////////////////////////////////////////////////////
        
        Cats *Tawny = [[Cats alloc] init];
        Tawny.name = @"Rowan";
        Tawny.currLoyaltyCounter = 10;
        Tawny.loyaltyThreshold = 12;
        Tawny.maxLoyalty = 24;
        Tawny.specificFood = [[NSMutableArray alloc] init];
        Tawny.specificItems = [[NSMutableArray alloc] init];
        Tawny.inClan = false;
        Tawny.onScreen = false;
        Tawny.CatPositionPictures = [[NSMutableArray alloc]init];
        [Tawny.CatPositionPictures addObject:@"tawny-pose-1.png"];
        [[GameData sharedGameData].allCatsInGame setObject:Tawny forKey:@"Tawny"];
        
        NSArray* allCatNamesPlease = [[GameData sharedGameData].allCatsInGame allKeys];
        for (int tyu = 0; tyu < [allCatNamesPlease count]; tyu ++){
            Cats *revisedCat = [[GameData sharedGameData].allCatsInGame objectForKey:allCatNamesPlease[tyu]];
            revisedCat.associatedItem = @"123456";
        }
        
    }
    
    
    
    // initialize master items dictionary if it hasn't been created (will run the first time you launch).
    if (!([GameData sharedGameData].allItemsInGame)){
        
        [GameData sharedGameData].allItemsInGame = [[NSMutableDictionary alloc] init];
        
        // each item has a name, cost, isBeingUsed boolean, isOnScreen boolean, an associated cat variable, the position the cat should be in (future implementation), and the item picture
        DecorativeItems *blackberryBush = [[DecorativeItems alloc]init];
        blackberryBush.itemName = @"Blackberry Bush";
        blackberryBush.cost = 60;
        blackberryBush.isBeingUsed = NO;
        blackberryBush.isBought = NO;
        blackberryBush.isOnScreen = NO;
        blackberryBush.associatedCat = @"45678";
        blackberryBush.positionOfCat = @"headLeaves";
        blackberryBush.picture = @"blackberry-bush.png";
        [[GameData sharedGameData].allItemsInGame setObject:blackberryBush forKey:@"Blackberry Bush"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *pileLeaves = [[DecorativeItems alloc]init];
        pileLeaves.itemName = @"Pile Of Leaves";
        pileLeaves.cost = 40;
        pileLeaves.isBeingUsed = NO;
        pileLeaves.isBought = NO;
        pileLeaves.isOnScreen = NO;
        pileLeaves.associatedCat = @"45678";
        pileLeaves.positionOfCat = @"headLeaves";
        pileLeaves.picture = @"pileLeaves.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:pileLeaves forKey:@"Pile Of Leaves"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *birdSkull = [[DecorativeItems alloc]init];
        birdSkull.itemName = @"Bird Skull";
        birdSkull.cost = 250;
        birdSkull.isBeingUsed = NO;
        birdSkull.isBought = NO;
        birdSkull.isOnScreen = NO;
        birdSkull.associatedCat = @"45678";
        birdSkull.positionOfCat = @"onHead";
        birdSkull.picture = @"birdSkull.png";
        [[GameData sharedGameData].allItemsInGame setObject:birdSkull forKey:@"Bird Skull"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *treeStump = [[DecorativeItems alloc]init];
        treeStump.itemName = @"Tree Stump";
        treeStump.cost = 120;
        treeStump.isBeingUsed = NO;
        treeStump.isBought = NO;
        treeStump.isOnScreen = NO;
        treeStump.associatedCat = @"45678";
        treeStump.positionOfCat = @"laying";
        treeStump.picture = @"stump.png";
        [[GameData sharedGameData].allItemsInGame setObject:treeStump forKey:@"Tree Stump"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *ballMoss = [[DecorativeItems alloc]init];
        ballMoss.itemName = @"Ball of Moss";
        ballMoss.cost = 80;
        ballMoss.isBeingUsed = NO;
        ballMoss.isBought = NO;
        ballMoss.isOnScreen = NO;
        ballMoss.associatedCat = @"45678";
        ballMoss.positionOfCat = @"swatting";
        ballMoss.picture = @"mossball.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:ballMoss forKey:@"Ball of Moss"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *hawkFeather = [[DecorativeItems alloc]init];
        hawkFeather.itemName = @"Hawk Feather";
        hawkFeather.cost = 50;
        hawkFeather.isBeingUsed = NO;
        hawkFeather.isBought = NO;
        hawkFeather.isOnScreen = NO;
        hawkFeather.associatedCat = @"45678";
        hawkFeather.positionOfCat = @"rolling";
        hawkFeather.picture = @"feather.png";
        [[GameData sharedGameData].allItemsInGame setObject:hawkFeather forKey:@"Hawk Feather"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *bigStick = [[DecorativeItems alloc]init];
        bigStick.itemName = @"Big Stick";
        bigStick.cost = 30;
        bigStick.isBeingUsed = NO;
        bigStick.isBought = NO;
        bigStick.isOnScreen = NO;
        bigStick.associatedCat = @"45678";
        bigStick.positionOfCat = @"rolling";
        bigStick.picture = @"stick.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:bigStick forKey:@"Big Stick"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *flowers = [[DecorativeItems alloc]init];
        flowers.itemName = @"Flowers";
        flowers.cost = 70;
        flowers.isBeingUsed = NO;
        flowers.isBought = NO;
        flowers.isOnScreen = NO;
        flowers.associatedCat = @"45678";
        flowers.positionOfCat = @"swatting";
        flowers.picture = @"flowers_300.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:flowers forKey:@ "Flowers"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *hollowTrunk = [[DecorativeItems alloc]init];
        hollowTrunk.itemName = @"Hollow Trunk";
        hollowTrunk.cost = 150;
        hollowTrunk.isBeingUsed = NO;
        hollowTrunk.isBought = NO;
        hollowTrunk.isOnScreen = NO;
        hollowTrunk.associatedCat = @"45678";
        hollowTrunk.positionOfCat = @"headHole";
        hollowTrunk.picture = @"log.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:hollowTrunk forKey:@"Hollow Trunk"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *flatRock = [[DecorativeItems alloc]init];
        flatRock.itemName = @"Small Flat Rock";
        flatRock.cost = 110;
        flatRock.isBeingUsed = NO;
        flatRock.isBought = NO;
        flatRock.isOnScreen = NO;
        flatRock.associatedCat = @"45678";
        flatRock.positionOfCat = @"laying";
        flatRock.picture = @"flatRock.png";
        [[GameData sharedGameData].allItemsInGame setObject:flatRock forKey:@"Small Flat Rock"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *sunningRocks = [[DecorativeItems alloc]init];
        sunningRocks.itemName = @"Sunning Rocks";
        sunningRocks.cost = 160;
        sunningRocks.isBeingUsed = NO;
        sunningRocks.isBought = NO;
        sunningRocks.isOnScreen = NO;
        sunningRocks.associatedCat = @"45678";
        sunningRocks.positionOfCat = @"laying";
        sunningRocks.picture = @"granite.png";
        [[GameData sharedGameData].allItemsInGame setObject:sunningRocks forKey:@"Sunning Rocks"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *ribCage = [[DecorativeItems alloc]init];
        ribCage.itemName = @"Rib Cage";
        ribCage.cost = 320;
        ribCage.isBeingUsed = NO;
        ribCage.isBought = NO;
        ribCage.isOnScreen = NO;
        ribCage.associatedCat = @"45678";
        ribCage.positionOfCat = @"laying";
        ribCage.picture = @"ribcage.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:ribCage forKey:@"Rib Cage"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *mossyNest = [[DecorativeItems alloc]init];
        mossyNest.itemName = @"Mossy Nest";
        mossyNest.cost = 240;
        mossyNest.isBeingUsed = NO;
        mossyNest.isBought = NO;
        mossyNest.isOnScreen = NO;
        mossyNest.associatedCat = @"45678";
        mossyNest.positionOfCat = @"sleeping";
        mossyNest.picture = @"nest.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:mossyNest forKey:@"Mossy Nest"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *ashTree = [[DecorativeItems alloc]init];
        ashTree.itemName = @"Ash Tree";
        ashTree.cost = 430;
        ashTree.isBeingUsed = NO;
        ashTree.isBought = NO;
        ashTree.isOnScreen = NO;
        ashTree.associatedCat = @"45678";
        ashTree.positionOfCat = @"sitting";
        ashTree.picture = @"ashtree.png"; 
        [[GameData sharedGameData].allItemsInGame setObject:ashTree forKey:@"Ash Tree"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *femur = [[DecorativeItems alloc]init];
        femur.itemName = @"Femur";
        femur.cost = 280;
        femur.isBeingUsed = NO;
        femur.isBought = NO;
        femur.isOnScreen = NO;
        femur.associatedCat = @"45678";
        femur.positionOfCat = @"rolling";
        femur.picture = @"bone"; 
        [[GameData sharedGameData].allItemsInGame setObject:femur forKey: @"Femur"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        DecorativeItems *scratchingBark = [[DecorativeItems alloc]init];
        scratchingBark.itemName = @"Scratching Bark";
        scratchingBark.cost = 220;
        scratchingBark.isBeingUsed = NO;
        scratchingBark.isBought = NO;
        scratchingBark.isOnScreen = NO;
        scratchingBark.associatedCat = @"45678";
        scratchingBark.positionOfCat = @"laying";
        scratchingBark.picture = @"treetrunk.png";
        [[GameData sharedGameData].allItemsInGame setObject:scratchingBark forKey:@"Scratching Bark"];
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
    }
    
    //ADD FOOD
    if (!([GameData sharedGameData].allFoodInGame)) {
        [GameData sharedGameData].allFoodInGame = [[NSMutableDictionary alloc] init];
        Food *mouse = [[Food alloc]init];
        mouse.name = @"Mouse";
        mouse.cost = 3;
        mouse.isBeingUsed = NO;
        mouse.isBought = NO;
        mouse.isOnScreen = NO;
        mouse.associatedCat = @"45678";
        mouse.positionOfCat = @"sitting";
        mouse.foodPic = @"mouse.png";
        [[GameData sharedGameData].allFoodInGame setObject:mouse forKey:@"Mouse"];
        
        Food *rabbit = [[Food alloc]init];
        rabbit.name = @"Rabbit";
        rabbit.cost = 6;
        rabbit.isBeingUsed = NO;
        rabbit.isBought = NO;
        rabbit.isOnScreen = NO;
        rabbit.associatedCat = @"45678";
        rabbit.positionOfCat = @"sitting";
        rabbit.foodPic = @"rabbit.png";
        [[GameData sharedGameData].allFoodInGame setObject:rabbit forKey:@"Rabbit"];
        
        Food *bird = [[Food alloc]init];
        bird.name = @"Bird";
        bird.cost = 9;
        bird.isBeingUsed = NO;
        bird.isBought = NO;
        bird.isOnScreen = NO;
        bird.associatedCat = @"45678";
        bird.positionOfCat = @"sitting";
        bird.foodPic = @"bird.png";
        [[GameData sharedGameData].allFoodInGame setObject:bird forKey:@"Bird"];
        
        Food *fish = [[Food alloc]init];
        fish.name = @"Fish";
        fish.cost = 12;
        fish.isBeingUsed = NO;
        fish.isBought = NO;
        fish.isOnScreen = NO;
        fish.associatedCat = @"45678";
        fish.positionOfCat = @"sitting";
        fish.foodPic = @"fish.png";
        [[GameData sharedGameData].allFoodInGame setObject:fish forKey:@"Fish"];
        
        currFoodsAndPosOnScreen = [NSMutableDictionary dictionaryWithDictionary:[GameData sharedGameData].FoodAndPosOnScreen];
        
        NSArray *allFoodNames = [[GameData sharedGameData].allFoodInGame allKeys];
        NSLog(@"%@", allFoodNames);
    }

    

    // these two items will be given to the player at the start.
    DecorativeItems *BlackberryBush = [[GameData sharedGameData].allItemsInGame objectForKey:@"Blackberry Bush"];
    BlackberryBush.isBought = YES;
    
    DecorativeItems *flatRock32 = [[GameData sharedGameData].allItemsInGame objectForKey:@"Small Flat Rock"];
    flatRock32.isBought = YES;
    
    
    
    // for debugging purposes
    NSArray *allItemNames = [[GameData sharedGameData].allItemsInGame allKeys];
    NSLog(@"%@", allItemNames);
    
    
    // highschore1  was used as a testing tool
    highScore1 = [GameData sharedGameData].highScore;

    // if CatsAndPosOnScreen and ItemsAndPos on screen have't been intialized, intialize them.
    if (!([GameData sharedGameData].CatsAndPosOnScreen)){
        [GameData sharedGameData].CatsAndPosOnScreen = [[NSMutableDictionary alloc]init];
    }
    
   if (!([GameData sharedGameData].ItemsAndPosOnScreen)){
        [GameData sharedGameData].ItemsAndPosOnScreen = [[NSMutableDictionary alloc]init];

    }

    


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // copy the data structures to the currCatsAndPosOnScreen so that the cats don't change (leave or come) when you switch views within the same launch <--- the cats and items are loaded in from currCatsAndPosOnScreen and currItemsAndPosOnScreen....during a particular launch, these values do not change and so the items and cats on the screen remain consistent. the CatsAndPosOnScreen and ItemsAndPosOnScreen do change within the same launch...which is why this is needed
    currCatsAndPosOnScreen = [NSMutableDictionary dictionaryWithDictionary:[GameData sharedGameData].CatsAndPosOnScreen];
    
    currItemsAndPosOnScreen = [NSMutableDictionary dictionaryWithDictionary:[GameData sharedGameData].ItemsAndPosOnScreen];
    
    food1 = [GameData sharedGameData].isFood;
    

    
    //// This starts the actual start-up screen logic
    
    //FIRST....DETERMINE IF ANY CATS CURRENTLY ON SCREEN NEED TO LEAVE
    
    int howManyCatsOnScreen = [currCatsAndPosOnScreen count];
    NSMutableArray *catsCurrentlyOnScreen = [[NSMutableArray alloc]initWithArray: [currCatsAndPosOnScreen allKeys]];
    
    NSLog(@"***************************");


    
    
    // if there is at least one cat on this screen, go into the following loop (for each cat on screen)
    if (howManyCatsOnScreen > 0){
        // testing purposes
        NSLog(@"HEYYYYYYYYY IN THE IF STATEMENT");
        
        // get a random number from 0 to 4; if the random number is 0, delete the cat you are talking about it.
        int randomIntToUse = 5;
        for (int abc = 0; abc < [catsCurrentlyOnScreen count]; abc ++){
            int result = arc4random_uniform(randomIntToUse);
            // testing purposes
            NSLog(@"Random Result was: %i", result);
            if (result == 0){
                // testing purposes
                NSLog(@"HEYYYYYYYYY RESULT EQUALED 0!!!!");
                NSString *deletedCatName = catsCurrentlyOnScreen[abc];
                Cats *deletedCat = [[GameData sharedGameData].allCatsInGame objectForKey: deletedCatName];
                
                // if a cat needs to be deleted, increase its loyalty counter by one (unless it is already at its max loyalty)
                if (deletedCat.currLoyaltyCounter < deletedCat.maxLoyalty){
                    deletedCat.currLoyaltyCounter ++;
                    if (deletedCat.currLoyaltyCounter >= deletedCat.loyaltyThreshold){
                        deletedCat.inClan = 1;
                    }
                }
                
                // change the deleted cat's on screen value to false, deassociate it with any items, set the items isBeingUsed value to NO. Add between 0 to the deleted cat's current loyalty prey points to the prey point total
                deletedCat.onScreen = false;
                NSString *associatedItemName = deletedCat.associatedItem;
                DecorativeItems *itemFreedUp = [[GameData sharedGameData].allItemsInGame objectForKey:associatedItemName];
                itemFreedUp.associatedCat = @"45678"; 
                itemFreedUp.isBeingUsed = NO;
                itemFreedUp.isOnScreen  = YES; 
                deletedCat.associatedItem = @"123456";
                int addedPreyPoints = arc4random_uniform(deletedCat.currLoyaltyCounter + 1);
                [GameData sharedGameData].preyPoints += addedPreyPoints;
                // testing purposes
                NSLog(@"Total PreyPoints = %i", [GameData sharedGameData].preyPoints);
                
                [currCatsAndPosOnScreen removeObjectForKey:catsCurrentlyOnScreen[abc]];
                [[GameData sharedGameData].CatsAndPosOnScreen removeObjectForKey:catsCurrentlyOnScreen[abc]];
                [catsCurrentlyOnScreen removeObjectAtIndex:abc];
                abc --; // all other enteries are shifted to the left
                
            } ///////// END OF CAT DELETION
        } //// end of for loop
    } //// end of if.
    
    NSLog(@"***************************");

    
    // Now go through each cat in the game and put them in the available or not available group; Cats that are already on the screen are automatically not available. Cats may be unavialble because their specific food or items are not on the screen....the logic is set up, but we have not implemented it yet because it we did not have time to check it for bugs.
    NSMutableArray *catsAvailableToGoOnScreen = [[NSMutableArray alloc]init]; // <---- only names of cats, not actual cat objs
    
    NSMutableArray *catsNotAvailableToGoONScreen = [[NSMutableArray alloc] init];
    NSArray *allCatNames = [[GameData sharedGameData].allCatsInGame allKeys];
    for (int qwe = 0; qwe < [allCatNames count]; qwe ++){
        Cats *catWeAreDealingWith = [[GameData sharedGameData].allCatsInGame objectForKey: allCatNames[qwe]];
        if (catWeAreDealingWith.onScreen == false){
            bool shouldBeAvailable = true;
            if ([catWeAreDealingWith.specificItems count] == 0){
                [catsAvailableToGoOnScreen addObject:catWeAreDealingWith.name];
            }
            else{
                for (int ert = 0; ert<[catWeAreDealingWith.specificItems count]; ert ++){
                    if ([currItemsAndPosOnScreen objectForKey:catWeAreDealingWith.specificItems[ert]] == nil){
                        [catsNotAvailableToGoONScreen addObject:catWeAreDealingWith.name];
                        shouldBeAvailable = false;
                        break;
                        
                    }
                }
                
                if (shouldBeAvailable == true){
                    [catsAvailableToGoOnScreen addObject:catWeAreDealingWith.name];
                }
            }
        }
        
    }
    
    /////// Testing purposes
    
    NSLog (@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    NSLog(@"All the bloody cats in the catsAvailableToGoOnScreen...should be all the cats! %@", catsAvailableToGoOnScreen);
    NSLog (@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    
    ////////  testing purposes
    
    
    
    
    ///// END OF GOING THROUGH EACH CAT AND PUTTING THEM IN AVAILABLE OR UN-AVAILABLE GROUP.
    
    
    // Go through each item and put in an availabe or not available group. The available group contains items that are not being used and are on screen.
    NSMutableArray *itemOnScreenAndNotBeingUsed = [[NSMutableArray alloc]init];
    NSArray *allTheItemNames = [[GameData sharedGameData].allItemsInGame allKeys];
    for (int rty = 0; rty <[allItemNames count]; rty ++){
        DecorativeItems *itemInQuestion = [[GameData sharedGameData].allItemsInGame objectForKey:allTheItemNames[rty]];
        if (itemInQuestion.isBeingUsed == NO && itemInQuestion.isOnScreen == YES){
            [itemOnScreenAndNotBeingUsed addObject: allTheItemNames[rty]];
        }
        
    }
    
    
    /////// testing purposes
    
     NSLog (@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
     NSLog(@"All the bloody items in the itemOnScreenAndNotBeingUsed...should be none of the items right now! %@", itemOnScreenAndNotBeingUsed);
     NSLog (@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    

    
    /////// END OF SORTING ITEMS
    
    //////  IMPLEMENT LOGIC FOR WHICH CATS GET TO GO ON WHICH FREE ITEMS ON SCREEN

    // now, for each item that is available (on screen and not being used)....get a random number between 0 and the number of available cats *5. If the number is between 0 and the number of available cats -1, add the cat at the random number's index to the item. Do some bookkeeping like setting the items isBeingUsed value to YES and other things of that nature. 
    for (int sdf = 0; sdf < [itemOnScreenAndNotBeingUsed count]; sdf++){
        DecorativeItems *itemTalkedAbout = [[GameData sharedGameData].allItemsInGame objectForKey:itemOnScreenAndNotBeingUsed[sdf]];
        int numOfAvailableCats = [catsAvailableToGoOnScreen count];
        int inputForArc4Uniform = 5*numOfAvailableCats;
        int randomNumGenerated = arc4random_uniform(inputForArc4Uniform);
        NSLog(@"The random number that was generated was: %i", randomNumGenerated);
        if (randomNumGenerated < numOfAvailableCats){
            [currCatsAndPosOnScreen setObject: itemTalkedAbout.itemPosition forKey:catsAvailableToGoOnScreen[randomNumGenerated]];
            ////// VVVV KEY POINT HERE
            [[GameData sharedGameData].CatsAndPosOnScreen setObject:itemTalkedAbout.itemPosition forKey:catsAvailableToGoOnScreen[randomNumGenerated]];
            Cats *catAboutToBeAddedOnScreen = [[GameData sharedGameData].allCatsInGame objectForKey:catsAvailableToGoOnScreen[randomNumGenerated]];
            catAboutToBeAddedOnScreen.onScreen = YES;
            catAboutToBeAddedOnScreen.associatedItem = itemTalkedAbout.itemName; 
            NSLog (@"The cat that was added added to the currCatsAndPos is: %@ at position %@; the item it is associated with is %@", catsAvailableToGoOnScreen[randomNumGenerated], itemTalkedAbout.itemPosition, itemOnScreenAndNotBeingUsed[sdf]);
            [catsAvailableToGoOnScreen removeObjectAtIndex:randomNumGenerated];
            itemTalkedAbout.isBeingUsed = YES;
            itemTalkedAbout.associatedCat = catAboutToBeAddedOnScreen.name;
            
        }
        
    }
    
    NSLog(@"#######################################################################");

    
    /////// END OF CATS ON FREE ITEMS IMPLEMENTATION
    
    
    
    
    ///////////////////////////////// END OF ACTUAL START-SCREEN LOGIC
    
    
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
