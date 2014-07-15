//
//  BPViewController.m
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/21/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import "BPViewController.h"

@interface BPViewController ()

@end

@implementation BPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.hero = [[BPCharacter alloc] init];
    self.hero.healthRemaining = 100;
    self.hero.damagePoints = 50;
    
    self.boss = [[BPCharacter alloc] init];
    self.boss.healthRemaining = 100;
    self.boss.damagePoints = 50;
    
    BPTileFactory *tileFactory = [[BPTileFactory alloc] init];
    self.tileMap = [tileFactory createTileMap];
    
    self.currentPos = CGPointMake(0, 0);
    
    BPTile *tile = [[self.tileMap objectAtIndex:self.currentPos.x] objectAtIndex:self.currentPos.y];
    self.storyLabel.text = tile.storyDescription;
    
    self.backgroundImageView.image = tile.backgroundImage;
    
    [self.actionBtnOutlet setTitle:tile.buttonDescription forState:UIControlStateNormal];
    self.actionBtnOutlet.hidden = tile.isActionBtnHidden;
    
    self.weaponLabel.text = tile.weaponInTile.itemName;
    self.hero.currentWeapon = tile.weaponInTile;
    self.hero.damagePoints += tile.weaponInTile.damageBonus;
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.hero.damagePoints];
    
    self.armorLabel.text = tile.armorInTile.itemName;
    self.hero.currentArmor = tile.armorInTile;
    self.hero.healthRemaining += tile.armorInTile.armorBonus;
    
    self.hero.healthRemaining += tile.healthBonus;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.hero.healthRemaining];
    
    self.canMove = tile.canMove;
    
    tile.isAlreadyTraversed = YES;
    
    [[self.tileMap objectAtIndex:self.currentPos.x] replaceObjectAtIndex:self.currentPos.y withObject:tile];
    
    self.northBtnOutlet.hidden = NO;
    self.eastBtnOutlet.hidden = NO;
    self.westBtnOutlet.hidden = YES;
    self.southBtnOutlet.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionBtnClicked:(UIButton *)sender {
    BPTile *tile = [[self.tileMap objectAtIndex:self.currentPos.x] objectAtIndex:self.currentPos.y];
    tile.canMove = YES;
    self.canMove = tile.canMove;
    
    if(tile.isAlreadyTraversed == NO) {
        self.hero.healthRemaining += tile.healthBonus;
        
        if(tile.weaponInTile != nil) {
            self.hero.damagePoints = self.hero.damagePoints - self.hero.currentWeapon.damageBonus;
            self.hero.currentWeapon = tile.weaponInTile;
            self.hero.damagePoints += self.hero.currentWeapon.damageBonus;
            self.weaponLabel.text = self.hero.currentWeapon.itemName;
            self.damageLabel.text = [NSString stringWithFormat:@"%i", self.hero.damagePoints];
            tile.isAlreadyTraversed = YES;
        } else if(tile.armorInTile != nil) {
            self.hero.healthRemaining = self.hero.healthRemaining - self.hero.currentArmor.armorBonus;
            self.hero.currentArmor = tile.armorInTile;
            self.armorLabel.text = self.hero.currentArmor.itemName;
            self.hero.healthRemaining += self.hero.currentArmor.armorBonus;
            tile.isAlreadyTraversed = YES;
        }

    }
    
    if (tile.isBossFight) {
        self.boss.healthRemaining -= self.hero.damagePoints;
        if (self.boss.healthRemaining == 0) {
            [self showGameWon];
        }
        self.hero.healthRemaining -= self.boss.damagePoints;
        tile.isAlreadyTraversed = YES;
    }
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.hero.healthRemaining];
    
    if (self.hero.healthRemaining <= 0) {
        [self showDeadAlert];
    }
    
    [[self.tileMap objectAtIndex:self.currentPos.x] replaceObjectAtIndex:self.currentPos.y withObject:tile];
    
}

- (IBAction)northBtnClicked:(UIButton *)sender {
    if(self.canMove) {
        self.currentPos = CGPointMake(self.currentPos.x, self.currentPos.y+1);
        [self performMoveTile];
    }
}

- (IBAction)eastBtnClicked:(UIButton *)sender {
    if (self.canMove) {
        self.currentPos = CGPointMake(self.currentPos.x+1, self.currentPos.y);
        [self performMoveTile];
    }
}

- (IBAction)southBtnClicked:(UIButton *)sender {
    if (self.canMove) {
        self.currentPos = CGPointMake(self.currentPos.x, self.currentPos.y-1);
        [self performMoveTile];
    }
}

- (IBAction)westBtnClicked:(UIButton *)sender {
    if (self.canMove) {
        self.currentPos = CGPointMake(self.currentPos.x-1, self.currentPos.y);
        [self performMoveTile];
    }
}

- (IBAction)resetBtnClicked:(UIButton *)sender {
    [self viewDidLoad];
}

- (void)performMoveTile {
    //check if valid tile
    if(self.currentPos.x <= 3
       && self.currentPos.x >= 0
       && self.currentPos.y >= 0
       && self.currentPos.y <= 3) {
        
        //checking if character is already on rightmost part of map
        if (self.currentPos.x == 3) {
            self.eastBtnOutlet.hidden = YES;
        } else {
            self.eastBtnOutlet.hidden = NO;
        }
        
        //checking if character is already on left part of map
        if (self.currentPos.x == 0) {
            self.westBtnOutlet.hidden = YES;
        } else {
            self.westBtnOutlet.hidden = NO;
        }
        
        //checking if character is already on top part of map
        if (self.currentPos.y == 3) {
            self.northBtnOutlet.hidden = YES;
        } else {
            self.northBtnOutlet.hidden = NO;
        }
        
        //checking if character is already on bottom part of map
        if (self.currentPos.y == 0) {
            self.southBtnOutlet.hidden = YES;
        } else {
            self.southBtnOutlet.hidden = NO;
        }
        
        [self copyTileToView];
    }
}

- (void)copyTileToView {
    BPTile *tile = [[self.tileMap objectAtIndex:self.currentPos.x] objectAtIndex:self.currentPos.y];
    self.storyLabel.text = tile.storyDescription;
    
    self.backgroundImageView.image = tile.backgroundImage;
    
    [self.actionBtnOutlet setTitle:tile.buttonDescription forState:UIControlStateNormal];
    self.actionBtnOutlet.hidden = tile.isActionBtnHidden;
    
    self.hero.healthRemaining += tile.healthBonus;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.hero.healthRemaining];
    
    self.canMove = tile.canMove;
    
    [[self.tileMap objectAtIndex:self.currentPos.x] replaceObjectAtIndex:self.currentPos.y withObject:tile];
    
    if (self.hero.healthRemaining <= 0) {
        [self showDeadAlert];
    }
}

- (void)showDeadAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died. Restart the game" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    self.northBtnOutlet.hidden = YES;
    self.southBtnOutlet.hidden = YES;
    self.eastBtnOutlet.hidden = YES;
    self.westBtnOutlet.hidden = YES;
    self.actionBtnOutlet.hidden = YES;
    
    [alertView show];
}

- (void)showGameWon {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You win" message:@"Congratulations! You defeated Plankton!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
}
@end
