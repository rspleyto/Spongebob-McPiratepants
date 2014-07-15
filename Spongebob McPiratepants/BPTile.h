//
//  BPTile.h
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/28/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPWeapon.h"
#import "BPArmor.h"

@interface BPTile : NSObject

@property (strong, nonatomic) NSString *storyDescription;
@property (strong, nonatomic) NSString *buttonDescription;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) BPWeapon *weaponInTile;
@property (strong, nonatomic) BPArmor *armorInTile;
@property (nonatomic) BOOL isBossFight;
@property (nonatomic) BOOL isActionBtnHidden;
@property (nonatomic) int healthBonus;
@property (nonatomic) BOOL isAlreadyTraversed;
@property (nonatomic) BOOL canMove;

@end
