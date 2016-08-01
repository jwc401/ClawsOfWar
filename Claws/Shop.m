//
//  Shop.m
//  Claws
//
//  Created by Sarah Lerner on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Shop used to purchase items (decorations and food)

#import "Shop.h"
#import "GameViewController.h"
#import "GameData.h"
#import "currentStateGameData.h"
#import "DecorativeItems.h"
#import "DecorationInventory.h"
#import "Food.h"
#import "FoodInventory.h"

@interface Shop ()

@end

@implementation Shop

//If we tapped on a item row in the shop 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    itemBought =  myData[indexPath.row];
    NSString *addedItem = [[NSString alloc] initWithFormat:@"%@", itemBought];
    //NSLog(@"***************************");

    if ([[GameData sharedGameData].allItemsInGame objectForKey:addedItem] != nil){ //Check through all items
        DecorativeItems *desiredItem = [[GameData sharedGameData].allItemsInGame objectForKey:addedItem];
        if (desiredItem.isBought == NO){ //If the item hasn't been bought, and you have enough prey points, buy it
            if (([GameData sharedGameData].preyPoints) >= desiredItem.cost){ //If you have enough prey points to buy it
                [GameData sharedGameData].preyPoints -= desiredItem.cost; //Subtract the cost from your 'wallet'
                desiredItem.isBought = YES; //Set the item as bought
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath: indexPath]; //Update the table cell for that item..
                cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]; //..and grey it out
                //NSLog(@"You bought %@", itemBought);
            }
            
        }
    }
    else if ([[GameData sharedGameData].allFoodInGame objectForKey:addedItem] != nil){ //Check through all food
        Food *desiredFood = [[GameData sharedGameData].allFoodInGame objectForKey:addedItem];
        if (desiredFood.isBought == NO){ //If the food hasn't been bought, and you have enough prey points, buy it
            if (([GameData sharedGameData].preyPoints) >= desiredFood.cost){ //If you have enough prey points to buy it
                [GameData sharedGameData].preyPoints -= desiredFood.cost; //Subtract the cost from your 'wallet'
                desiredFood.isBought = YES; //Set the item as bought
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath: indexPath]; //Update the table cell for that item..
                cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]; //..and grey it out
                //NSLog(@"You bought %@", itemBought);
            }
            
        }
    }
}

//Checks the item so that if the item was bought just now the row become highlighted.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *addedItem = [[NSString alloc] initWithFormat:@"%@", myData[indexPath.row]];
    if ([[GameData sharedGameData].allItemsInGame objectForKey:addedItem] != nil) { //Is item
        DecorativeItems *desiredItem = [[GameData sharedGameData].allItemsInGame objectForKey:addedItem];
        if (desiredItem.isBought == NO){
            return YES;
        }
    }
    else if ([[GameData sharedGameData].allFoodInGame objectForKey:addedItem] != nil) { //Is food
        Food *desiredFood = [[GameData sharedGameData].allFoodInGame objectForKey:addedItem];
        if (desiredFood.isBought == NO){
            return YES;
        }
    }
    return NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    //myData = [[GameData sharedGameData].allItemsInGame allKeys]; //Place all the decorations into the shop!
    NSArray *itemList = [[GameData sharedGameData].allItemsInGame allKeys];
    NSArray *foodList = [[GameData sharedGameData].allFoodInGame allKeys];
    myData = [itemList arrayByAddingObjectsFromArray: foodList];
}

//Number of rows to be displayed...
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [myData count]; //...is the number of items that exist
}


//Maintain table cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *name = [myData objectAtIndex:indexPath.row]; //Name of object at that location
    //[cell.textLabel setText: text];
    
    //Fades text if something was bought
    NSString *addedItem = [[NSString alloc] initWithFormat:@"%@", myData[indexPath.row]];
    DecorativeItems *desiredItem = [[GameData sharedGameData].allItemsInGame objectForKey:addedItem];
    name = [[NSString alloc] initWithFormat:@"%@ ..... %d", name, desiredItem.cost];
    if (desiredItem.isBought == YES){
        cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    }
    [cell.textLabel setText: name];
    return cell; //Returns the cell with the object's name, modified colored/highlighted/etc if it was bought
}



@end
