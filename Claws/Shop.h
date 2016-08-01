//
//  Shop.h
//  Claws
//
//  Created by Sarah Lerner on 5/1/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shop : UITableViewController <UITableViewDelegate, UITableViewDataSource>
//Table view used to display the item/food shop and purchase said things

{
    IBOutlet UITableView *ShopTableView; //UI Table View to actually do the displaying
    
    NSArray *myData; //Array of items existing for purchase (Still includes already owned ones. Those are greyed out and un-tappable) 
    
    NSString *itemBought; //If something is tapped, it can be bought. This sends the specific one
    
}
@end
