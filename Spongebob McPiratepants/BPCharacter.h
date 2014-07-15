//
//  BPCharacter.h
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/28/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPArmor.h"
#import "BPWeapon.h"

@interface BPCharacter : NSObject

@property (nonatomic) int healthRemaining;
@property (nonatomic) int damagePoints;
@property (strong, nonatomic) BPWeapon *currentWeapon;
@property (strong, nonatomic) BPArmor *currentArmor;

@end
