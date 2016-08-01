//
//  Inventory.m
//  Claws
//
//  Created by Jonathan Chua on 4/30/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "DecorationInventory.h"
#import "StartViewController.h"
#import "GameViewController.h"
#import "GameData.h"
#import "currentStateGameData.h"
#import "Cats.h"
#import "DecorativeItems.h"
#import "AddItemScreen.h"

//Inventory for decorative items. Can select an item to go to the AddItemScreen to choose a place to put it

@interface DecorationInventory ()

@end


@implementation DecorationInventory

/*If the shop buys an item:*/
- (IBAction)addToInventory:(id)sender { //
    NSString *addedItem = [[NSString alloc] initWithFormat:@"%s", "itemName"];
    if ([[GameData sharedGameData].allItemsInGame objectForKey:addedItem] != nil) { //If this is a decorative item
        DecorativeItems *itemYouWantToModify = [[GameData sharedGameData].allItemsInGame objectForKey:addedItem];
        itemYouWantToModify.isBought = YES; //Update owned status
    }
}



//If the table row was tapped (tapped on a decoration)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //indexPath.row
    itemSent =  myData[indexPath.row]; //Get the decoration that was tapped on
    [self performSegueWithIdentifier:@"DecorationInventorySegue" sender:self]; //Send it along the segue for processing
}


//Send on the segue to the AddItemScreen
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //following lines needed only if you need to send some detail across to ContactViewController
    if ([[segue identifier] isEqualToString:@"DecorationInventorySegue"]) { //Send along specified segue
        AddItemScreen *controller = (AddItemScreen *)segue.destinationViewController;
        controller.addItem = itemSent; //Sends over the selected item for placement
    }
    
}
 


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // table view data is being set here
    
    
    NSArray *myData1 = [[GameData sharedGameData].allItemsInGame allKeys]; //Get all the items
    myData = [[NSMutableArray alloc]init]; 
    for (int fg = 0; fg < [myData1 count]; fg++){ //For all the items
        DecorativeItems *perhapsItemAdd = [[GameData sharedGameData].allItemsInGame objectForKey:myData1[fg]];
        if (perhapsItemAdd.isBought == YES){ //If we own it
            [myData addObject:perhapsItemAdd.itemName]; //Add it to the array of items we own so that only those are shown in the table

        }
    }
    
       // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [myData count];
}


//Actually display the table of decorations
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell.textLabel setText:[myData objectAtIndex:indexPath.row]]; //Set the cell properties to the item's
    return cell;
}


@end
