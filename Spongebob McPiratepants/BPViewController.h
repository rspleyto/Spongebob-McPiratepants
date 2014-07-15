//
//  BPViewController.h
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/21/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPTileFactory.h"
#import "BPCharacter.h"

@interface BPViewController : UIViewController

//Character Stats
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (nonatomic) BOOL canMove;
@property (strong, nonatomic) BPCharacter *hero;
@property (strong, nonatomic) BPCharacter *boss;

//Story description
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

//Background Image
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

//Button outlets
@property (strong, nonatomic) IBOutlet UIButton *actionBtnOutlet;
@property (strong, nonatomic) IBOutlet UIButton *northBtnOutlet;
@property (strong, nonatomic) IBOutlet UIButton *eastBtnOutlet;
@property (strong, nonatomic) IBOutlet UIButton *southBtnOutlet;
@property (strong, nonatomic) IBOutlet UIButton *westBtnOutlet;

//Character's current position
@property (nonatomic) CGPoint currentPos;
@property (strong, nonatomic) BPTile *currentTile;
@property (strong, nonatomic) NSMutableArray *tileMap;

//Action click event
- (IBAction)actionBtnClicked:(UIButton *)sender;

//Direction click event
- (IBAction)northBtnClicked:(UIButton *)sender;
- (IBAction)eastBtnClicked:(UIButton *)sender;
- (IBAction)southBtnClicked:(UIButton *)sender;
- (IBAction)westBtnClicked:(UIButton *)sender;

//reset click event
- (IBAction)resetBtnClicked:(UIButton *)sender;

- (void)performMoveTile;
- (void)copyTileToView;
- (void)showDeadAlert;

@end
