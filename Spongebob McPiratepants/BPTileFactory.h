//
//  BPTileFactory.h
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/28/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPTile.h"
#import "BPUtility.h"

@interface BPTileFactory : NSObject

@property (strong, nonatomic) NSMutableArray *tileList;
@property (strong, nonatomic) NSMutableArray *weaponList;
@property (strong, nonatomic) NSMutableArray *armorList;
@property (strong, nonatomic) BPUtility *utility;

- (id) init;
- (void) initializeWeaponList;
- (void) initializeArmorList;
- (void) initializeTileList;
- (NSMutableArray *) createTileMap;

@end
