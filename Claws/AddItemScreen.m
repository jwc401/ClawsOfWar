//
//  AddItemScreen.m
//  Claws
//
//  Created by Jonathan Chua on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Screen to choose what location that you want to put the item that you just selected to the main game screen

#import "AddItemScreen.h"
#import "GameViewController.h"
#import "DecorativeItems.h"
#import "currentStateGameData.h"
#import "Cats.h"

@interface AddItemScreen ()

@end

@implementation AddItemScreen


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _itemName.text = _addItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// depending on which button was hit to cause the navigation back to the main game screen, you have to set the placed item's position appropriately

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // first, you have to delete the item that currently inhabits the chosen position...(delete it from the screen, not the game)...you have to disassociate the item with any cats - you have to set variables such as isBeingUsed and itemPosition, etc too...basic bookkeeping
     if ([[segue identifier] isEqualToString:@"4thPosition"]) {
         GameViewController *controller = [segue destinationViewController];
         controller.itemToAddFromInventory = _addItem;  ///// MIGHT NOT NEED THIS
         int howManyItemsOnScreenNow = [[GameData sharedGameData].ItemsAndPosOnScreen count];
         NSArray *allItemNamesOnScreen = [[GameData sharedGameData].ItemsAndPosOnScreen allKeys];
         for (int thy = 0; thy < howManyItemsOnScreenNow; thy++){ //// DEAL WITH ITEM TO BE DELETED
             NSNumber *positionOfItemBeingDiscussed = [[GameData sharedGameData].ItemsAndPosOnScreen objectForKey:allItemNamesOnScreen[thy]];
             if ([positionOfItemBeingDiscussed isEqual:@4]){
                 [[GameData sharedGameData].ItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                 [currItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                 DecorativeItems *actualItemThatWasDeleted = [[GameData sharedGameData].allItemsInGame objectForKey:allItemNamesOnScreen[thy]];
                 actualItemThatWasDeleted.isOnScreen = NO;
                 actualItemThatWasDeleted.isBeingUsed = NO;
                 actualItemThatWasDeleted.itemPosition = @0;
                 actualItemThatWasDeleted.associatedCat = @"45678";
                 
             } // end if
         }// end for ---- end of dealing with Item to be deleted
         
         // you have to get rid of any cats that are in that position...same basic bookkeeping as getting rid of the old item
         int howManyCatsOnScreenNow = [[GameData sharedGameData].CatsAndPosOnScreen count];
         NSArray *allCatNamesOnScreen = [[GameData sharedGameData].CatsAndPosOnScreen allKeys];
         for (int iop = 0; iop <howManyCatsOnScreenNow; iop++){
             NSNumber *positionOfCatBeingDiscussed = [[GameData sharedGameData].CatsAndPosOnScreen objectForKey:allCatNamesOnScreen[iop]];
             if ([positionOfCatBeingDiscussed isEqual:@4]){
                 [[GameData sharedGameData].CatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                 [currCatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                 Cats *actualCatToBeDeleted = [[GameData sharedGameData].allCatsInGame objectForKey:allCatNamesOnScreen[iop]];
                 actualCatToBeDeleted.associatedItem = @"123456";
                 actualCatToBeDeleted.onScreen = NO;
                 if (actualCatToBeDeleted.currLoyaltyCounter < actualCatToBeDeleted.maxLoyalty){
                     actualCatToBeDeleted.currLoyaltyCounter ++;
                     if (actualCatToBeDeleted.currLoyaltyCounter >= actualCatToBeDeleted.loyaltyThreshold){
                         actualCatToBeDeleted.inClan = 1;
                     }
                     
                 }
                 
                 int addedPreyPoints = arc4random_uniform(actualCatToBeDeleted.currLoyaltyCounter + 1);
                 [GameData sharedGameData].preyPoints += addedPreyPoints;

                 
             } //if
         } // end for ----- end of dealing with Cat to be Deleted
         
         // you have to add in the new item in the correct position now. Update some of the item's variables. Bookkeeping
         [[GameData sharedGameData].ItemsAndPosOnScreen setObject:@4 forKey: _addItem];
         [currItemsAndPosOnScreen setObject:@4 forKey:_addItem];
         DecorativeItems *actualItemToBeAdded = [[GameData sharedGameData].allItemsInGame objectForKey:_addItem];
         actualItemToBeAdded.itemPosition = @4;
         if([actualItemToBeAdded.associatedCat isEqualToString:@"45678"]){
             actualItemToBeAdded.isBeingUsed = NO;
         }
         else{
             [[GameData sharedGameData].CatsAndPosOnScreen setObject:@4 forKey:actualItemToBeAdded.associatedCat];
         }
         actualItemToBeAdded.isOnScreen = YES;
         
         
     } //end if 4thPosition
    
    
    // Do the same thing for the 3rd, 2nd, and 1st position buttons...in case one of those is hit 
    
    if ([[segue identifier] isEqualToString:@"3rdPosition"]) {
        GameViewController *controller = [segue destinationViewController];
        controller.itemToAddFromInventory = _addItem;  ///// MIGHT NOT NEED THIS
        int howManyItemsOnScreenNow = [[GameData sharedGameData].ItemsAndPosOnScreen count];
        NSArray *allItemNamesOnScreen = [[GameData sharedGameData].ItemsAndPosOnScreen allKeys];
        for (int thy = 0; thy < howManyItemsOnScreenNow; thy++){ //// DEAL WITH ITEM TO BE DELETED
            NSNumber *positionOfItemBeingDiscussed = [[GameData sharedGameData].ItemsAndPosOnScreen objectForKey:allItemNamesOnScreen[thy]];
            if ([positionOfItemBeingDiscussed isEqual:@3]){
                [[GameData sharedGameData].ItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                [currItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                DecorativeItems *actualItemThatWasDeleted = [[GameData sharedGameData].allItemsInGame objectForKey:allItemNamesOnScreen[thy]];
                actualItemThatWasDeleted.associatedCat = @"45678";
                actualItemThatWasDeleted.isOnScreen = NO;
                actualItemThatWasDeleted.isBeingUsed = NO;
                actualItemThatWasDeleted.itemPosition = @0;
                
            } // end if
        }// end for ---- end of dealing with Item to be deleted
        
        int howManyCatsOnScreenNow = [[GameData sharedGameData].CatsAndPosOnScreen count];
        NSArray *allCatNamesOnScreen = [[GameData sharedGameData].CatsAndPosOnScreen allKeys];
        for (int iop = 0; iop <howManyCatsOnScreenNow; iop++){
            NSNumber *positionOfCatBeingDiscussed = [[GameData sharedGameData].CatsAndPosOnScreen objectForKey:allCatNamesOnScreen[iop]];
            if ([positionOfCatBeingDiscussed isEqual:@3]){
                [[GameData sharedGameData].CatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                [currCatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                Cats *actualCatToBeDeleted = [[GameData sharedGameData].allCatsInGame objectForKey:allCatNamesOnScreen[iop]];
                actualCatToBeDeleted.associatedItem = @"123456";
                actualCatToBeDeleted.onScreen = NO;
                if (actualCatToBeDeleted.currLoyaltyCounter < actualCatToBeDeleted.maxLoyalty){
                    actualCatToBeDeleted.currLoyaltyCounter ++;
                    if (actualCatToBeDeleted.currLoyaltyCounter >= actualCatToBeDeleted.loyaltyThreshold){
                        actualCatToBeDeleted.inClan = 1;
                    }
                    
                }
                
                int addedPreyPoints = arc4random_uniform(actualCatToBeDeleted.currLoyaltyCounter + 1);
                [GameData sharedGameData].preyPoints += addedPreyPoints;
                
                
            } //if
        } // end for ----- end of dealing with Cat to be Deleted
        
        //////////// ADD IN THE ACTUAL ITEM NOW
        [[GameData sharedGameData].ItemsAndPosOnScreen setObject:@3 forKey: _addItem];
        [currItemsAndPosOnScreen setObject:@3 forKey:_addItem];
        DecorativeItems *actualItemToBeAdded = [[GameData sharedGameData].allItemsInGame objectForKey:_addItem];
        actualItemToBeAdded.itemPosition = @3;
        //////VV if item has an associated cat, isBeingUsed does not equate to NO....remains as YES.
        if([actualItemToBeAdded.associatedCat isEqualToString:@"45678"]){
            actualItemToBeAdded.isBeingUsed = NO;
        }
        else{
            [[GameData sharedGameData].CatsAndPosOnScreen setObject:@3 forKey:actualItemToBeAdded.associatedCat];
        }
        actualItemToBeAdded.isOnScreen = YES;
        
        
    } //end if 3rdPosition
    
    
    //////////////////////
    
    
    
    
    //////// 2nd POSITION TRY
    
    if ([[segue identifier] isEqualToString:@"2ndPosition"]) {
        GameViewController *controller = [segue destinationViewController];
        controller.itemToAddFromInventory = _addItem;  ///// MIGHT NOT NEED THIS
        int howManyItemsOnScreenNow = [[GameData sharedGameData].ItemsAndPosOnScreen count];
        NSArray *allItemNamesOnScreen = [[GameData sharedGameData].ItemsAndPosOnScreen allKeys];
        for (int thy = 0; thy < howManyItemsOnScreenNow; thy++){ //// DEAL WITH ITEM TO BE DELETED
            NSNumber *positionOfItemBeingDiscussed = [[GameData sharedGameData].ItemsAndPosOnScreen objectForKey:allItemNamesOnScreen[thy]];
            if ([positionOfItemBeingDiscussed isEqual:@2]){
                [[GameData sharedGameData].ItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                [currItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                DecorativeItems *actualItemThatWasDeleted = [[GameData sharedGameData].allItemsInGame objectForKey:allItemNamesOnScreen[thy]];
                actualItemThatWasDeleted.associatedCat = @"45678";
                actualItemThatWasDeleted.isOnScreen = NO;
                actualItemThatWasDeleted.isBeingUsed = NO;
                actualItemThatWasDeleted.itemPosition = @0;
                
            } // end if
        }// end for ---- end of dealing with Item to be deleted
        
        int howManyCatsOnScreenNow = [[GameData sharedGameData].CatsAndPosOnScreen count];
        NSArray *allCatNamesOnScreen = [[GameData sharedGameData].CatsAndPosOnScreen allKeys];
        for (int iop = 0; iop <howManyCatsOnScreenNow; iop++){
            NSNumber *positionOfCatBeingDiscussed = [[GameData sharedGameData].CatsAndPosOnScreen objectForKey:allCatNamesOnScreen[iop]];
            if ([positionOfCatBeingDiscussed isEqual:@2]){
                [[GameData sharedGameData].CatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                [currCatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                Cats *actualCatToBeDeleted = [[GameData sharedGameData].allCatsInGame objectForKey:allCatNamesOnScreen[iop]];
                actualCatToBeDeleted.associatedItem = @"123456";
                actualCatToBeDeleted.onScreen = NO;
                if (actualCatToBeDeleted.currLoyaltyCounter < actualCatToBeDeleted.maxLoyalty){
                    actualCatToBeDeleted.currLoyaltyCounter ++;
                    if (actualCatToBeDeleted.currLoyaltyCounter >= actualCatToBeDeleted.loyaltyThreshold){
                        actualCatToBeDeleted.inClan = 1;
                    }
                    
                }
                
                int addedPreyPoints = arc4random_uniform(actualCatToBeDeleted.currLoyaltyCounter + 1);
                [GameData sharedGameData].preyPoints += addedPreyPoints;
                
                
            } //if
        } // end for ----- end of dealing with Cat to be Deleted
        
        //////////// ADD IN THE ACTUAL ITEM NOW
        [[GameData sharedGameData].ItemsAndPosOnScreen setObject:@2 forKey: _addItem];
        [currItemsAndPosOnScreen setObject:@2 forKey:_addItem];
        DecorativeItems *actualItemToBeAdded = [[GameData sharedGameData].allItemsInGame objectForKey:_addItem];
        actualItemToBeAdded.itemPosition = @2;
        if([actualItemToBeAdded.associatedCat isEqualToString:@"45678"]){
            actualItemToBeAdded.isBeingUsed = NO;
        }
        else{
            [[GameData sharedGameData].CatsAndPosOnScreen setObject:@2 forKey:actualItemToBeAdded.associatedCat];
        }
        actualItemToBeAdded.isOnScreen = YES;
        
        
    } //end if 2ndPosition
    
    
    //////////////////////
    
    //////// 1st POSITION TRY
    
    if ([[segue identifier] isEqualToString:@"1stPosition"]) {
        GameViewController *controller = [segue destinationViewController];
        controller.itemToAddFromInventory = _addItem;  ///// MIGHT NOT NEED THIS
        int howManyItemsOnScreenNow = [[GameData sharedGameData].ItemsAndPosOnScreen count];
        NSArray *allItemNamesOnScreen = [[GameData sharedGameData].ItemsAndPosOnScreen allKeys];
        for (int thy = 0; thy < howManyItemsOnScreenNow; thy++){ //// DEAL WITH ITEM TO BE DELETED
            NSNumber *positionOfItemBeingDiscussed = [[GameData sharedGameData].ItemsAndPosOnScreen objectForKey:allItemNamesOnScreen[thy]];
            if ([positionOfItemBeingDiscussed isEqual:@1]){
                [[GameData sharedGameData].ItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                [currItemsAndPosOnScreen removeObjectForKey:allItemNamesOnScreen[thy]];
                DecorativeItems *actualItemThatWasDeleted = [[GameData sharedGameData].allItemsInGame objectForKey:allItemNamesOnScreen[thy]];
                actualItemThatWasDeleted.associatedCat = @"45678";
                actualItemThatWasDeleted.isOnScreen = NO;
                actualItemThatWasDeleted.isBeingUsed = NO;
                actualItemThatWasDeleted.itemPosition = @0;
                
            } // end if
        }// end for ---- end of dealing with Item to be deleted
        
        int howManyCatsOnScreenNow = [[GameData sharedGameData].CatsAndPosOnScreen count];
        NSArray *allCatNamesOnScreen = [[GameData sharedGameData].CatsAndPosOnScreen allKeys];
        for (int iop = 0; iop <howManyCatsOnScreenNow; iop++){
            NSNumber *positionOfCatBeingDiscussed = [[GameData sharedGameData].CatsAndPosOnScreen objectForKey:allCatNamesOnScreen[iop]];
            if ([positionOfCatBeingDiscussed isEqual:@1]){
                [[GameData sharedGameData].CatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                [currCatsAndPosOnScreen removeObjectForKey:allCatNamesOnScreen[iop]];
                Cats *actualCatToBeDeleted = [[GameData sharedGameData].allCatsInGame objectForKey:allCatNamesOnScreen[iop]];
                actualCatToBeDeleted.associatedItem = @"123456";
                actualCatToBeDeleted.onScreen = NO;
                if (actualCatToBeDeleted.currLoyaltyCounter < actualCatToBeDeleted.maxLoyalty){
                    actualCatToBeDeleted.currLoyaltyCounter ++;
                    if (actualCatToBeDeleted.currLoyaltyCounter >= actualCatToBeDeleted.loyaltyThreshold){
                        actualCatToBeDeleted.inClan = 1;
                    }
                    
                }
                
                int addedPreyPoints = arc4random_uniform(actualCatToBeDeleted.currLoyaltyCounter + 1);
                [GameData sharedGameData].preyPoints += addedPreyPoints;
                
                
            } //if
        } // end for ----- end of dealing with Cat to be Deleted
        
        //////////// ADD IN THE ACTUAL ITEM NOW
        [[GameData sharedGameData].ItemsAndPosOnScreen setObject:@1 forKey: _addItem];
        [currItemsAndPosOnScreen setObject:@1 forKey:_addItem];
        DecorativeItems *actualItemToBeAdded = [[GameData sharedGameData].allItemsInGame objectForKey:_addItem];
        actualItemToBeAdded.itemPosition = @1;
        if([actualItemToBeAdded.associatedCat isEqualToString:@"45678"]){
            actualItemToBeAdded.isBeingUsed = NO;
        }
        else{
            [[GameData sharedGameData].CatsAndPosOnScreen setObject:@1 forKey:actualItemToBeAdded.associatedCat]; 
        }
        actualItemToBeAdded.isOnScreen = YES;
        
        
    } //end if 1stPosition
    
    
    //////////////////////


    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
