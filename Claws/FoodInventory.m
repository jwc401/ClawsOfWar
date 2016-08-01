//
//  Inventory1.m
//  Claws
//
//  Created by Jonathan Chua on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Inventory for storing and displaying food. Can select on a food to place it on the game screen

#import "FoodInventory.h"
#import "StartViewController.h"
#import "GameViewController.h"
#import "GameData.h"
#import "currentStateGameData.h"
#import "Cats.h"
#import "Food.h"
#import "AddFoodScreen.h"

@interface FoodInventory ()

@end

@implementation FoodInventory

/*If the shop buys an item:*/
- (IBAction)addToInventory:(id)sender { //
    NSString *addedFood = [[NSString alloc] initWithFormat:@"%s", "foodName"];
    if ([[GameData sharedGameData].allFoodInGame objectForKey:addedFood] != nil) { //If this is food
        Food *foodYouWantToModify = [[GameData sharedGameData].allFoodInGame objectForKey:addedFood];
        foodYouWantToModify.isBought = YES; //Update owned status
    }
}



//If the table row was tapped (tapped on a food)
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //indexPath.row
    foodSent =  myData[indexPath.row]; //Get the food that was tapped on
    [self performSegueWithIdentifier:@"FoodInventorySegue" sender:self]; //Send it along the segue for processing
}


//Send on the segue to the AddFoodScreen
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //following lines needed only if you need to send some detail across to ContactViewController
    if ([[segue identifier] isEqualToString:@"FoodInventorySegue"]) { //Send along specified segue
        AddFoodScreen *controller = (AddFoodScreen *)segue.destinationViewController; //View controller that adds food to screen
        controller.addFood = foodSent; //Sends over the specific food for placement
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // table view data is being set here
    
    NSArray *myData1 = [[GameData sharedGameData].allFoodInGame allKeys]; //Get all the food
    NSLog(@"%@", myData1);
    myData = [[NSMutableArray alloc]init];
    for (int fg = 0; fg < [myData1 count]; fg++){ //For all the food
        Food *perhapsFoodAdd = [[GameData sharedGameData].allFoodInGame objectForKey:myData1[fg]];
        if (perhapsFoodAdd.isBought == YES){ //If we own it
            [myData addObject:perhapsFoodAdd.name]; //Add it to the array of food we already own
            
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
    
    [cell.textLabel setText:[myData objectAtIndex:indexPath.row]]; //Set the cell properties to be the food
    return cell;
}


@end
