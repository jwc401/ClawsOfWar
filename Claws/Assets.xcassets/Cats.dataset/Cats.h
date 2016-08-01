//
//  ViewController.h
//  Claws
//
//  Created by Libby Goss on 4/21/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cats : NSObject {
    NSString *name;
    NSString *description;
    NSNumber *currLoyaltyCounter;
    NSNumber *maxLoyalty;
    NSNumber *decorativeThreshold;
    NSArray *specificFood;
    NSArray *specificItems;
    NSNumber *inClan; //boolean
    UIImage *imagePos1; //
    UIImage *currPos;
    //other imagePos
    NSNumber *onScreen; //boolean
    NSNumber *available; //boolean
}


@end
