//
//  AddFoodScreen.h
//  Claws
//
//  Created by Jonathan Chua on 5/12/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddFoodScreen : UIViewController

//All the things needed when trying to add food to the main screen
@property (strong, nonatomic) IBOutlet NSString *addFood; //What food is being added
@property (strong, nonatomic) IBOutlet UITextField *foodName; //Text field changes depending on what item was selected in the table, helps the player keep track of it when selecting a location

@end
