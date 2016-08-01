//
//  AddItemScreen.h
//  Claws
//
//  Created by Jonathan Chua on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemScreen : UIViewController


//Properties used when adding items to the main game screen
@property (strong, nonatomic) IBOutlet NSString *addItem; //Item being added
@property (strong, nonatomic) IBOutlet UITextField *itemName; //Text field changes depending on what item was selected in the table, helps the player keep track of it when selecting a location

@end
