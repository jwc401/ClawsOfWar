//
//  AddFoodScreen.m
//  Claws
//
//  Created by Jonathan Chua on 5/12/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

//Screen used to add food to the main game scene. You simply tap the button in the middle to confirm that you want to place it

#import "AddFoodScreen.h"
#import "GameViewController.h"
#import "Food.h"
#import "currentStateGameData.h"
#import "Cats.h"


@interface AddFoodScreen ()

@end

@implementation AddFoodScreen


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _foodName.text = _addFood;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"FoodAdded"]) { //If we tap the button, we try to add the food
        GameViewController *controller = [segue destinationViewController]; //Send to game view controller
        controller.foodToAddFromInventory = _addFood; //Send and store what food is being added
        NSArray *keyArrayFoods = [currFoodsAndPosOnScreen allKeys];
        for (int chf=0; chf< [keyArrayFoods count]; chf++) { //Now check through all the foods and deactivate them being on the screen
            Food *foodDeactivation = keyArrayFoods[chf];
            foodDeactivation.isOnScreen = NO;
        }
        Food *actualFoodToBeAdded = [[GameData sharedGameData].allFoodInGame objectForKey:_addFood]; //Get the specific food item
        actualFoodToBeAdded.isOnScreen = YES; //Make this the only food piece being added to the main game, set it to appear
        [GameData sharedGameData].foodToAdd = _addFood;
        NSLog(@"%@", _addFood);
        NSLog(@"%@", [GameData sharedGameData].foodToAdd);
        //[[GameData sharedGameData].FoodAndPosOnScreen setObject forKey:;
        
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

@end

