//
//  BPUtility.m
//  Spongebob McPiratepants
//
//  Created by RS Pleyto on 6/28/14.
//  Copyright (c) 2014 Bunny Productions. All rights reserved.
//

#import "BPUtility.h"

@implementation BPUtility

- (NSMutableArray *) shuffleArray:(NSMutableArray *)originalArray {
    
    NSUInteger count = [originalArray count];
    int nElements = count - 1;
    int n;
    for (NSUInteger i = 0; i < count; i++) {
        n = (arc4random() % nElements) + 1;
        [originalArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return originalArray;
}

@end
