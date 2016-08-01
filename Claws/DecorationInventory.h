//
//  Inventory.h
//  Claws
//
//  Created by Jonathan Chua on 4/30/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//DECORATION INVENTORY

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DecorationInventory : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{ //Properties that our table of decorative item needs
    IBOutlet UITableView *DecorationTableView; //The UI Table that allows us to scroll through all the decorative items we bought
    
    NSMutableArray *myData; //Holds the decorations that we already own (either start with or bought in-store)
    
    NSString *itemSent; //If we tap on a decoration, we want to send the name of that item to the AddItemScreen for placement on the main game screen
    
}

@end