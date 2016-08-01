//
//  GameViewController.m
//  Claws
//
//  Created by Meet Mehta on 4/21/16.
//  Copyright (c) 2016 nyu.edu. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import <SpriteKit/SpriteKit.h>
#import "currentStateGameData.h"


// pretty much all created for us

@implementation GameViewController
@synthesize myMutableArray;
@synthesize displayScore;

NSMutableArray *globalStringArray;

int showDisplayScore;


NSMutableArray *getMyMutableArray(){
    return globalStringArray;
    
}

int getDisplayScore(){
    
    return highScore1;
}


- (void)viewDidLoad
{

    
    [super viewDidLoad];
    
    
    
    

    

    // Configure the view.
    SKView * skView;
    skView  = (SKView *)self.view;
     skView.showsFPS = YES;
    skView.allowsTransparency = YES;
    skView.showsNodeCount = YES;
    skView.ignoresSiblingOrder = YES;
    skView.layer.zPosition = 2;
    
    
    // Create and configure the scene.
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
