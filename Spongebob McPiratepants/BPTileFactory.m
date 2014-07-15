//
//  BPTileFactory.m
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/28/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import "BPTileFactory.h"

@implementation BPTileFactory

-(id) init {
    self = [super init];
    
    self.utility = [[BPUtility alloc] init];

    return self;
}

-(void) initializeWeaponList {
    self.weaponList = [[NSMutableArray alloc] init];
    BPWeapon *weapon1 = [[BPWeapon alloc] init];
    weapon1.itemName = @"Spatula";
    weapon1.healthBonus = 50;
    weapon1.damageBonus = 50;
    [self.weaponList addObject:weapon1];
    
    BPWeapon *weapon2 = [[BPWeapon alloc] init];
    weapon2.itemName = @"Gloves";
    weapon2.healthBonus = 0;
    weapon2.damageBonus = 30;
    [self.weaponList addObject:weapon2];
    
    BPWeapon *weapon3 = [[BPWeapon alloc] init];
    weapon3.itemName = @"Bubbles";
    weapon3.healthBonus = 20;
    weapon3.damageBonus = 20;
    [self.weaponList addObject:weapon3];
    
    BPWeapon *weapon4 = [[BPWeapon alloc] init];
    weapon4.itemName = @"J. Net";
    weapon4.healthBonus = 40;
    weapon4.damageBonus = 20;
    [self.weaponList addObject:weapon4];
    
    BPWeapon *weapon5 = [[BPWeapon alloc] init];
    weapon5.itemName = @"Mop";
    weapon5.healthBonus = 0;
    weapon5.damageBonus = 10;
    [self.weaponList addObject:weapon5];
    
    //self.weaponList = [self.utility shuffleArray:self.weaponList];
}

-(void) initializeArmorList {
    self.armorList = [[NSMutableArray alloc] init];
    BPArmor *armor1 = [[BPArmor alloc] init];
    armor1.itemName = @"Clown Wig";
    armor1.healthBonus = 0;
    armor1.armorBonus = 10;
    [self.armorList addObject:armor1];
    
    BPArmor *armor2 = [[BPArmor alloc] init];
    armor2.itemName = @"Trunks";
    armor2.healthBonus = 30;
    armor2.armorBonus = 30;
    [self.armorList addObject:armor2];
    
    BPArmor *armor3 = [[BPArmor alloc] init];
    armor3.itemName = @"Band Uniform";
    armor3.healthBonus = 50;
    armor3.armorBonus = 50;
    [self.armorList addObject:armor3];
    
    BPArmor *armor4 = [[BPArmor alloc] init];
    armor4.itemName = @"GG Hat";
    armor4.healthBonus = 0;
    armor4.armorBonus = 20;
    [self.armorList addObject:armor4];
    
    BPArmor *armor5 = [[BPArmor alloc] init];
    armor5.itemName = @"KK Cap";
    armor5.healthBonus = 20;
    armor5.armorBonus = 40;
    [self.armorList addObject:armor5];
    
    //self.armorList = [self.utility shuffleArray:self.armorList];
}

-(void) initializeTileList {
    
    self.tileList = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 16; i++) {
        [self.tileList addObject:[[BPTile alloc] init]];
    }
}

-(NSMutableArray *) createTileMap {
    
    [self initializeWeaponList];
    [self initializeArmorList];
    [self initializeTileList];
    
    //put all items to one list (weapons and armors)
    NSMutableArray *itemArray = [[NSMutableArray alloc] init];
    [itemArray addObjectsFromArray:self.weaponList];
    [itemArray addObjectsFromArray:self.armorList];
    itemArray = [self.utility shuffleArray:itemArray];
    
    //setup each tile
    BPTile *tempTile;
    for (int i = 0; i < 16; i++) {
        tempTile = [self.tileList objectAtIndex:i];
        switch (i) {
            case 0: {
                tempTile.storyDescription = @"There's trouble brewing in BB. Plankton stole King Neptune's crown and he's framing old man Krabs. It's up to you, Spongebob, to rescue Mr. Krabs before he gets hung in the HOOKS!!!";
                tempTile.buttonDescription = @"Rescue Mr. Krabs!";
                tempTile.backgroundImage = [UIImage imageNamed:@"Spongebob Intro.jpg"];
                
                BPWeapon *firstWeapon = [[BPWeapon alloc] init];
                firstWeapon.itemName = @"Fists";
                firstWeapon.healthBonus = 0;
                firstWeapon.damageBonus = 10;
                
                tempTile.weaponInTile = firstWeapon;
                
                BPArmor *firstArmor = [[BPArmor alloc] init];
                firstArmor.itemName = @"Clothes";
                firstArmor.healthBonus = 0;
                firstArmor.armorBonus = 10;
                
                tempTile.armorInTile = firstArmor;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = NO;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 1: {
                tempTile.storyDescription = @"You arrived at Goofy Goober's. The manager heard about your adventure and since you're his No.1 customer, he gave you ice cream plus a gooby goober hat for defense.";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Goofy Goober.jpg"];
                
                tempTile.weaponInTile = [self.armorList objectAtIndex:3];
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 30;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 2: {
                tempTile.storyDescription = @"Oh no! Squidward's being controlled by the Planton through the bucket on his head. Squidward charges towards you but you managed to escape with just a minor scratch. Phew!";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Squidward Mind Control.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = -15;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 3: {
                tempTile.storyDescription = @"Ouch! You forgot to wear your Anti-SeaRhinoceros underwear. You received serious damage!";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Sea Rhinoceros.jpeg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = -40;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 4: {
                tempTile.storyDescription = @"Aww... Mommy and Daddy followed you because you forgot your lunch. What nice parents.";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Spongebob Parents.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 20;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 5: {
                tempTile.storyDescription = @"You crossed paths with Sandy and handed you your Karate Gloves!";
                tempTile.buttonDescription = @"Wear Gloves";
                tempTile.backgroundImage = [UIImage imageNamed:@"Sandy Karate.jpg"];
                
                tempTile.weaponInTile = [self.weaponList objectAtIndex:1];
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 6: {
                tempTile.storyDescription = @"Patrick remembered that he kept both your Jellyfish nets inside his pants. This might help you fight your enemies on your journey.";
                tempTile.buttonDescription = @"Take J. Net";
                tempTile.backgroundImage = [UIImage imageNamed:@"Patrick Jellyfish Net.jpg"];
                
                tempTile.weaponInTile = [self.weaponList objectAtIndex:3];
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 7: {
                tempTile.storyDescription = @"Watch out... too late! Dennis grazed you with his giant boot. He inflicted a huge amount of damage to your health.";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Dennis Enemy.png"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = -50;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 8: {
                tempTile.storyDescription = @"Look out! There's a dangerous trench in front of you. Good thing Mindy is here to save the day. She also hands you a magical clown wig that may help you fight Plankton.";
                tempTile.buttonDescription = @"Wear Clown Wig";
                tempTile.backgroundImage = [UIImage imageNamed:@"Mindy.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = [self.armorList objectAtIndex:0];
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 9: {
                tempTile.storyDescription = @"You remembered the time you played the band with everyone to help Squidward get back on Squilliam Fancyson. You immediately took out your band uniform from back then knowing it might help strengthen your defense.";
                tempTile.buttonDescription = @"Wear Band Uniform";
                tempTile.backgroundImage = [UIImage imageNamed:@"Band Uniform.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = [self.armorList objectAtIndex:2];
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 10: {
                tempTile.storyDescription = @"Oh goody! It's David Hasselhoff! He did not only help us get back on track, but he also gave us a new weapon, your Spatula!";
                tempTile.buttonDescription = @"Take Spatula";
                tempTile.backgroundImage = [UIImage imageNamed:@"David Hasselhoff.jpg"];
                
                tempTile.weaponInTile = [self.weaponList objectAtIndex:0];
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 11: {
                tempTile.storyDescription = @"We finally arrived to Shell City through the help of the Cyclops, but what's this? What are all these sea creatures doing here all dried up? And it is also happening to us Patrick!";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Shell City.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = -10;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 12: {
                tempTile.storyDescription = @"Nothing to do here. Just random stuff.";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Spongebob.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 10;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 13: {
                tempTile.storyDescription = @"Nothing to do here. Just spikes hahaha!";
                tempTile.buttonDescription = @"";
                tempTile.backgroundImage = [UIImage imageNamed:@"Spongebob.jpg"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = -10;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = YES;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 14: {
                tempTile.storyDescription = @"Nothing to do here. Oooohhhh look! Bubbles!";
                tempTile.buttonDescription = @"Take Bubbles";
                tempTile.backgroundImage = [UIImage imageNamed:@"Spongebob.jpg"];
                
                tempTile.weaponInTile = [self.weaponList objectAtIndex:2];
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = NO;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = YES;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            case 15: {
                tempTile.storyDescription = @"It's SUPER PLANTON!! Defeat him!";
                tempTile.buttonDescription = @"Fight!";
                tempTile.backgroundImage = [UIImage imageNamed:@"Plankton Boss.png"];
                
                tempTile.weaponInTile = nil;
                tempTile.armorInTile = nil;
                
                tempTile.healthBonus = 0;
                tempTile.isBossFight = YES;
                tempTile.isActionBtnHidden = NO;
                tempTile.isAlreadyTraversed = NO;
                tempTile.canMove = NO;
                [self.tileList replaceObjectAtIndex:i withObject:tempTile];
            }
                break;
            default:
                break;
        }
    }
    
    NSMutableArray *tempArray = [self.tileList mutableCopy];
    [self.tileList removeAllObjects];
    [self.tileList addObject:[tempArray objectAtIndex:0]];
    [tempArray removeObjectAtIndex:0];
    tempArray = [self.utility shuffleArray:tempArray];
    [self.tileList addObjectsFromArray:tempArray];
    
    NSMutableArray *column0Tiles = [[NSMutableArray alloc] initWithObjects:[self.tileList objectAtIndex:0], [self.tileList objectAtIndex:1], [self.tileList objectAtIndex:2], [self.tileList objectAtIndex:3], nil];
    NSMutableArray *column1Tiles = [[NSMutableArray alloc] initWithObjects:[self.tileList objectAtIndex:4], [self.tileList objectAtIndex:5], [self.tileList objectAtIndex:6], [self.tileList objectAtIndex:7], nil];
    NSMutableArray *column2Tiles = [[NSMutableArray alloc] initWithObjects:[self.tileList objectAtIndex:8], [self.tileList objectAtIndex:9], [self.tileList objectAtIndex:10], [self.tileList objectAtIndex:11], nil];
    NSMutableArray *column3Tiles = [[NSMutableArray alloc] initWithObjects:[self.tileList objectAtIndex:12], [self.tileList objectAtIndex:13], [self.tileList objectAtIndex:14], [self.tileList objectAtIndex:15], nil];
    
    NSMutableArray *tiles = [[NSMutableArray alloc] initWithObjects:column0Tiles, column1Tiles, column2Tiles, column3Tiles, nil];
    return tiles;
}

@end
