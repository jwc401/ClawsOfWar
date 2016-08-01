//
//  Inventory1.h
//  Claws
//
//  Created by Jonathan Chua on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//FOOD INVENTORY

#import <UIKit/UIKit.h>

@interface FoodInventory : UITableViewController
{ //Properties that our table of foods needs
    IBOutlet UITableView *DecorationTableView; //The UI Table that allows us to scroll through all the decorative items we bought
    
    NSMutableArray *myData; //Holds the food that we already own (either start with or bought in-store)
    
    NSString *foodSent; //If we tap on a food, we want to send the name of that food to the AddFoodScreen for placement on the main game screen
    
}

@end